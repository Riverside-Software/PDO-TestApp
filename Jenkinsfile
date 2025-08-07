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
          withEnv(["PATH+ANT=${tool name: 'Ant 1.10', type: 'hudson.tasks.Ant$AntInstallation'}/bin", "DLC=${tool name: 'OpenEdge-12.8', type: 'jenkinsci.plugin.openedge.OpenEdgeInstallation'}"]) {
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
            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.0-SNAPSHOT.jar version-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy12864\" \"TestApp3.zip\" \"12.8\" \"C:\\FooBar\" \"1\" || exit /b 1"
            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.0-SNAPSHOT.jar delete-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy12864\" 5 || exit /b 1"

            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.0-SNAPSHOT.jar version-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy128\" \"TestApp3.zip\" \"12.8\" \"C:\\FooBar\" \"0\" || exit /b 1"
            bat "java -jar C:\\Tools\\pdo\\pdo-groovy-3.0.0-SNAPSHOT.jar delete-java17.groovy \"https://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy128\" 5 || exit /b 1"
            // bat "echo Disabled for now..."
            // rem Z:\Tools\signtool\signtool.exe sign /t http://timestamp.comodoca.com/authenticode /f Z:\Jenkins\comodo.p12 /p "%COMODO_PASSWORD%" /path/to/bundle.exe
          }
        }
      }
    }

    // stage ('deployment') {
    //   steps {
    //     node ('windows') {
    //       ws ("Z:\\TestDeployment\\${BRANCH_NAME}") {
    //         unstash name: 'windows-build'
    //         unzip zipFile: 'TestApp3.zip'
    //         bat 'del TestApp3.zip'
    //         withEnv(["DLC=${tool name: 'OpenEdge-11.7', type: 'jenkinsci.plugin.openedge.OpenEdgeInstallation'}"]) {
    //           bat "echo OK..."
    //         }
    //       }
    //     }
    //     node ('linux') {
    //       ws ("/ebs/ebs1/TestDeployment/${BRANCH_NAME}") {
    //         unstash name: 'linux-build'
    //         unzip zipFile: 'linux.zip'
    //         sh 'rm linux.zip'
    //       }
    //     }
    //   }
    // }

  }
}
