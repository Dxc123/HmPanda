// Script for compiling build behavior. It is built in the build plug-in and cannot be modified currently.
import { hapTasks }  from '@ohos/hvigor-ohos-plugin';

// 1、导入
import { routerRegisterPlugin, PluginConfig } from 'router-register-plugin'

// 2、初始化配置
const config: PluginConfig = {
  // scanDirs: ['src/main/ets/pages', 'src/main/ets/views'], // 扫描的目录，如果不设置，默认是扫描src/main/ets目录
  logEnabled: true, // 查看日志
  viewNodeInfo: false, // 查看节点信息
  isAutoDeleteHistoryFiles: true, // 删除无用编译产物
  lifecycleObserverAttributeName: 'xxx' // 可选，设置全局的生命周期实现类在组件上的属性名，默认值是lifecycleObserver

}
export default {
  system: hapTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  // 3、添加插件
  plugins:[routerRegisterPlugin(config)]
}
