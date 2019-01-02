pipeline {
  agent { label 'windows' }
  options {
    buildDiscarder(logRotator(numToKeepStr:'10'))
    timeout(time: 15, unit: 'MINUTES')
    skipDefaultCheckout()
  }

  stages {
    stage ('Build') {
      steps {
        checkout([$class: 'GitSCM', branches: scm.branches, extensions: scm.extensions + [[$class: 'CleanCheckout']], userRemoteConfigs: scm.userRemoteConfigs])
        script {
          withEnv(["PATH+ANT=${tool name: 'Ant 1.9', type: 'hudson.tasks.Ant$AntInstallation'}/bin", "DLC=${tool name: 'OpenEdge-11.7', type: 'jenkinsci.plugin.openedge.OpenEdgeInstallation'}"]) {
            bat "git rev-parse --short HEAD > src/git.txt"
            bat "ant -DVERSION=11.7 -DDLC=%DLC% -lib Z:\\Tools\\PCT\\PCT-Latest.jar build dist"
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
          bat "echo Disabled for now..."
          // bat "java -cp Z:\\Tools\\pdo\\pdo-groovy.jar groovy.ui.GroovyMain version.groovy \"http://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy\" \"TestApp3.zip\" \"11.7\" \"C:\\FooBar\" || exit /b 1"
          // bat "java -cp Z:\\Tools\\pdo\\pdo-groovy.jar groovy.ui.GroovyMain delete.groovy \"http://pdo.riverside-software.fr\" \"Riverside\" \"TestAppGroovy\" 5 || exit /b 1"
          // rem Z:\Tools\signtool\signtool.exe sign /t http://timestamp.comodoca.com/authenticode /f Z:\Jenkins\comodo.p12 /p "%COMODO_PASSWORD%" /path/to/bundle.exe
        }
      }
    }

    // stage ('deployment') {
    //   node ('windows') {
    //     ws ("Z:\\TestDeployment\\${BRANCH_NAME}") {
    //       unstash name: 'windows-build'
    //       unzip zipFile: 'TestApp3.zip'
    //       bat 'del TestApp3.zip'
    //       withEnv(["DLC=${tool name: 'OpenEdge-11.7', type: 'jenkinsci.plugin.openedge.OpenEdgeInstallation'}"]) {
    //         bat "echo OK..."
    //       }
    //     }
    //   }
    //   node ('linux') {
    //     ws ("/ebs/ebs1/TestDeployment/${BRANCH_NAME}") {
    //       unstash name: 'linux-build'
    //       unzip zipFile: 'linux.zip'
    //       sh 'rm linux.zip'
    //     }
    //   }
    // }

  }
}
