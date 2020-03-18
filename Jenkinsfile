node('ben') {
    timestamps {
        withEnv([
            'DEVICE=tl-wdr4300-v1',
            'BRANCH=openwrt-19.07',
            'SYSTEM_PATH=/home/benlue/openwrt',
            'OUTPUT_PATH=/home/benlue/openwrt/out/target/product',
            ]) {
        
            stage('OpenWRT Preparation') {
                checkout([$class: 'GitSCM', branches: [[name: '$BRANCH']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], [$class: 'RelativeTargetDirectory', relativeTargetDir: '/home/benlue/openwrt']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/openwrt/openwrt.git']]])
                //sh label: 'Clone', script: 'git clone https://github.com/TeamOpenwrt/tl-wdr4300-v1.git $SYSTEM_PATH/build_script'
                //sh label: 'Preparation', script: 'source $SYSTEM_PATH/build_script/preparation.sh'
            }
            stage('DEVICE Preparation') { // for display purposes
                //sh label: 'RepoSync', script: 'source $SYSTEM_PATH/build_script/reposync.sh'
                checkout([$class: 'GitSCM', branches: [[name: '*/openwrt-19.07']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], [$class: 'RelativeTargetDirectory', relativeTargetDir: '/home/benlue/openwrt/build_script']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/TeamOpenwrt/tl-wdr4300-v1.git']]])
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
