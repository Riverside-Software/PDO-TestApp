import eu.rssw.pdo.ws.Pdo
import eu.rssw.pdo.ws.PdoAPI
import eu.rssw.pdo.ws.Product
import eu.rssw.pdo.ws.Version
import eu.rssw.pdo.ws.StartupMode
import eu.rssw.pdo.ws.FileUploadParameter;
import eu.rssw.pdo.ws.MsiInstallerProperty;
import eu.rssw.pdo.ws.MsiInstallerPropertyArray;

import javax.activation.DataHandler;
import javax.xml.ws.Binding;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.soap.SOAPBinding;
import java.net.URL;

import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.frontend.ClientProxy;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;

// In order to use Ant tasks
// def ant = new AntBuilder()
// ant.get src: "http://jenkins.rssw.eu/job/Dev1-PDO-TestApp/lastSuccessfulBuild/artifact/TestApp3.zip", dest: "TestApp3.zip"

Pdo padeo = new Pdo(new URL(args[0] + '/ws/padeo?wsdl'))
PdoAPI srv = padeo.getPdoPort()

Binding b = ((BindingProvider) srv).getBinding();
((SOAPBinding) b).setMTOMEnabled(true);

// 30 seconds for connection timeout, and no timeout for receive operation
HTTPConduit http = (HTTPConduit) ClientProxy.getClient(srv).getConduit();
HTTPClientPolicy httpClientPolicy = new HTTPClientPolicy();
httpClientPolicy.setConnectionTimeout(30000);
httpClientPolicy.setReceiveTimeout(0);
httpClientPolicy.setAllowChunking(false)
http.setClient(httpClientPolicy);

Product p = null;
try {
  println "Looking for product..."
  p = srv.getProduct(args[1], args[2])
} catch (eu.rssw.pdo.ws.RecordNotFoundException_Exception caught) {
  println "Not found. Creating new product..."
  p = srv.createProduct(new Product(vendorName: args[1], productName: args[2], patches: false), false /* Create initial version */)
}

println "Looking for version..."
Version v
if (p.getVersions().size() == 0)
  v = srv.createVersion(p.getId(), 1)
else if (p.getVersions().get(p.getVersions().size() - 1).isActive())
  v = srv.createVersion(p.getId(), 3 /* Patch */)
else
  v = p.getVersions().get(p.getVersions().size() - 1)
println "Version found. Updating version info"
srv.updateVersion(v.id, args[4], "CHANGELOG " + new Date());

DataHandler handler = new DataHandler(new URL('file:///' + new File(args[3]).getAbsolutePath()));
FileUploadParameter param = new FileUploadParameter();
param.setVersionId(v.getId());
// Prevents .dll to be tagged as .net assemblies
param.setApplyActions(false);
param.setFile(handler);
println "Uploading file..."
srv.uploadFiles(param);

// OCX files as SelfReg
println "Tagging OCX files..."
srv.getDirectory(v.id).files.each { element -> if (element.fileName == 'pstimer.ocx') srv.updateMsiAction(element.id, 1); }
srv.getDirectory(v.id).files.each { element -> if (element.fileName == 'Flash32_11_9_900_117.ocx') srv.updateMsiAction(element.id, 1); }

// Delete every StartupMode, in order to recreate them
println "Deleting existing startup modes..." 
v.startupModes.each { element -> srv.deleteStartupMode(element.id) }

println "Creating new startup modes..."
StartupMode sm1 = srv.createStartupMode2(v.id, 1, "-p mainwin.r -param PROWCINI", "TestApplication1" /* Shortcut name */, 1 /* PROWCINI */, "" /* Base URL */, "WinGrid/SamplesExplorer/Graphics/Indicators/jupiter_icon.ico")
StartupMode sm2 = srv.createStartupMode2(v.id, 2, "-p mainwin.r -param PROWCEXE", "TestApplication2" /* Shortcut name */, 2 /* PROWCEXE */, "" /* Base URL */, "WinGrid/SamplesExplorer/Graphics/Indicators/jupiter_icon.ico")
StartupMode sm3 = srv.createStartupMode(v.id, 3, "-p mainwin.r -param NONE", "" /* Shortcut name */, 3 /* NONE */, "" /* Base URL */)
StartupMode sm4 = srv.createStartupMode2(v.id, 4, "-p mainwin.r -param PROWCINI", "TestApplication3" /* Shortcut name */, 1 /* PROWCINI */, "[JSE_ROOT][VENDOR_NAME].[PRODUCT_NAME]?version=[CURRENT_VERSION]&var1=[BUNDLEVAR1]&var=[BUNDLEVAR2]&mode={mode}[USER_MODE]" /* Base URL */, "WinGrid/SamplesExplorer/Graphics/Indicators/jupiter_icon.ico")
srv.setDefaultMode(sm3.id);

println "Generating MSI files..."
eu.rssw.pdo.ws.PackageGenerationReport report = srv.generateMSI(v.id)
if (!report.packagePresent) {
 println "CANDLE REPORT"
 for (i in report.candleReport) { println "** " + i }
 println "LIGHT REPORT"
 for (i in report.lightReport) { println "** " + i }
}


println "Activating version..."
int retVal = srv.activateVersion(v.id)
if (retVal != 0) {
  println "Version not activated : " + retVal;
  return 1;
}

println "Generating install bundle..."
MsiInstallerPropertyArray lst = new MsiInstallerPropertyArray()
lst.item = new java.util.ArrayList<MsiInstallerProperty>()
if (args.length >= 6) {
  println "Using TARGETDIR=" + args[5]
  MsiInstallerProperty targetDirProp = new MsiInstallerProperty()
  targetDirProp.setName("TARGETDIR")
  targetDirProp.setValue(args[5])
  lst.item.add(targetDirProp)
}
report = srv.generateBundleProps(v.id, args[4], false, false, false, lst)
if (!report.packagePresent) {
  println "Bundle not generated : ";
  return 1;
}

println "Done !"

// new AntBuilder().copy src:"/path/to/padeodir/$args[1]/$args[2]/$v.versionNumber/bundle/bundle.exe", dest:'/path/to/bundles/$args[1].$args[2].bundle.exe'