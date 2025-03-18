import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { ZRouter } from '@hzw/zrouter';
import WindowUtils from '../common/utils/WindowUtils';
import { AppUtil } from '@pura/harmony-utils';


export default class EntryAbility extends UIAbility {
  /// UIAbility实例创建时触发，可进行相关初始化操作
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    // 如果项目中存在hsp模块则传入true
    ZRouter.initialize((config) => {
      config.isLoggingEnabled = true
      config.isHSPModuleDependent = false
      config.onDynamicLoadComplete = () => {
        console.log("已完成所有模块的加载")
      }
    })

    AppUtil.init(this.context);
  }
  ///UIAbility销毁时触发,可进行系统资源的释放、数据的保存等操作。
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  /// UIAbility创建窗口时触发，可进行相关UI初始化操作
  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // 主窗口创建后，设置主页面
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    const windowClass = await windowStage.getMainWindow();
    // windowClass.setWindowLayoutFullScreen(true);
    WindowUtils.init(windowClass);

    // App入口
    windowStage.loadContent('pages/main/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  // 释放UI页面资源(在UIAbility实例销毁之前触发)
  onWindowStageDestroy() {
    // 主窗口被销毁，释放 UI 相关资源
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  // UIAbility切换至前台时触发
  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }
  // UIAbility切换至后台时候触发
  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}