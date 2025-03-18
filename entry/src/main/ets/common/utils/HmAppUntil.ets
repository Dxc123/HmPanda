import { AppUtil } from "@pura/harmony-utils";

export class HmAppUntil {
  /// 退出应用
  static exit() {
    AppUtil.exit()
  }
  /// 获取版本名
  static getVersionName(): string {
    return AppUtil.getVersionName()
  }
  /// 获取版本号
  static getVersionCode(): number {
    return AppUtil.getVersionCode()
  }
  /// 获取包名
  static  getBundleName(): string {
    return AppUtil.getBundleName()
  }

///获取底部导航条的高度，单位为px。
  static  getNavigationIndicatorHeight(): number {
    return AppUtil.getNavigationIndicatorHeight()
  }
  /// 获取状态栏高度，单位为px。
  static  getStatusBarHeight(): number {
    return AppUtil.getStatusBarHeight()
  }
}