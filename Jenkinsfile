node('ben') {
    timestamps {
        withEnv([
            'DEVICE=tl-wdr4300',
            'BRANCH=openwrt-19.07',
            'SYSTEM_PATH=/home/benlue/openwrt',
            'OUTPUT_PATH=/home/benlue/openwrt/out/target/product',
            ]) {
            stage('Preparation') { // for display purposes
            
                checkout([$class: 'GitSCM', 
                    branches: [[name: "$BRANCH"]], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'RelativeTargetDirectory', 
                    relativeTargetDir: '/home/benlue/openwrt']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/openwrt/openwrt.git']]])
                //sh label: 'Preparation', script: 'source $SYSTEM_PATH/build_script/preparation.sh'
            }
            stage('RepoSync') { // for display purposes
                //sh label: 'RepoSync', script: 'source $SYSTEM_PATH/build_script/reposync.sh'
            }
            stage('Build') { // for display purposes
                //sh label: 'Build', script: 'source $SYSTEM_PATH/build_script/build.sh'
            }
            stage('OTA Upload') { // for display purposes
                //sh label: 'OTA Upload', script: 'source $SYSTEM_PATH/build_script/upload.sh'
            }
        }
    }
}
