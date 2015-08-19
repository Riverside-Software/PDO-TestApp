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
  println "Not found, exiting..."
  return 1
}

Version activeVersion = p.versions.last()
println "Last version number : " + activeVersion.versionNumber
for (Version v : p.getVersions()) {
  if (v.versionNumber < activeVersion.versionNumber - args[3].toInteger()) {
    println "Deleting version " + v.versionNumber
    srv.deleteVersion(v.id)
  }
}

println "Done !"
