pipeline {
  agent { label 'windows' }
  options {
    buildDiscarder(logRotator(numToKeepStr:'10'))
    timeout(time: 15, unit: 'MINUTES')
    skipDefaultCheckout()
    copyArtifactPermission('*');
  }

  stages {
    stage ('Build') {
      steps {
        checkout([$class: 'GitSCM', branches: scm.branches, extensions: scm.extensions + [[$class: 'CleanCheckout']], userRemoteConfigs: scm.userRemoteConfigs])
        script {
          withEnv(["PATH+ANT=${tool name: 'Ant 1.10', type: 'ant'}/bin", "DLC=${tool name: 'OpenEdge-12.8', type: 'openedge'}"]) {
            bat "git rev-parse --short HEAD > src/git.txt"
            bat "ant -DVERSION=12.8 -DDLC=%DLC% -lib %DLC%\\pct\\PCT.jar dist"
          }
        }
        stash name: 'windows-build', includes: 'TestApp3.zip'
        stash name: 'linux-build', includes: 'linux.zip'
        archiveArtifacts artifacts: 'TestApp*.zip'
      }
    }

    stage ('WebClient') {
      steps {
        script {
          withEnv(["PATH+JDK=${tool name: 'JDK17', type: 'jdk'}/bin"]) {
            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.2.jar version-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy12864\" \"TestApp3.zip\" \"12.8\" \"C:\\FooBar\" \"1\" || exit /b 1"
            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.2.jar delete-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy12864\" 5 || exit /b 1"

            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.2.jar version-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy128\" \"TestApp3.zip\" \"12.8\" \"C:\\FooBar\" \"0\" || exit /b 1"
            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.2.jar delete-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy128\" 5 || exit /b 1"
          }
        }
      }
    }

  }
}
