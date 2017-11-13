#!groovy

stage ('Build') {
  node ('windows') {
    checkout([
      $class: 'GitSCM',
      branches: scm.branches,
      extensions: scm.extensions + [[$class: 'CleanCheckout']],
      userRemoteConfigs: scm.userRemoteConfigs
    ])
    withEnv(["PATH+ANT=${tool name: 'Ant 1.9', type: 'hudson.tasks.Ant$AntInstallation'}/bin", "DLC=${tool name: 'OpenEdge-11.7', type: 'jenkinsci.plugin.openedge.OpenEdgeInstallation'}"]) {
      bat "ant -DVERSION=11.7 -DDLC=%DLC% -lib Z:\\Tools\\PCT\\PCT-Latest.jar build dist"
    }
    stash name: 'windows-build', includes: 'TestApp3.zip'
  }
}

stage ('WebClient') {
  node ('windows') {
    bat "java -cp Z:\\Tools\\pdo\\pdo-groovy.jar groovy.ui.GroovyMain version.groovy \"http://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy\" \"TestApp3.zip\" \"11.7\" \"C:\\FooBar\" || exit /b 1"
    // bat "java -cp Z:\\Tools\\pdo\\pdo-groovy.jar groovy.ui.GroovyMain delete.groovy \"http://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy\" 5 || exit /b 1"
    // rem Z:\Tools\signtool\signtool.exe sign /t http://timestamp.comodoca.com/authenticode /f Z:\Jenkins\comodo.p12 /p "%COMODO_PASSWORD%" /path/to/bundle.exe
  }
}

stage ('deployment') {
  node ('windows') {
    ws ("Z:\\TestDeployment\\${BRANCH_NAME}") {
      unstash name: 'windows-build'
      script {
        def ant = new AntBuilder()
        ant.unzip src: 'TestApp3.zip', dest: '.'
      }
    }
  }
}
