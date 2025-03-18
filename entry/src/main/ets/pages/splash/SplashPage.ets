import { Route, ZRouter } from '@hzw/zrouter';
import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants';
import { Routes } from '../../routes/RouterConst';
import Logger from '../../common/utils/Logger';


@Preview
@Component
@Route({ name: Routes.SPLASH_PAGE })
export struct SplashPage {
  @State countDownSeconds: number = 2;
  private timeId: number = 0;

  // // @Entry装饰器装饰的组件，就代表一个页面
  // ///页面的生命周期函数
  // onPageShow(){
  // // 页面每次显示时触发。
  //   console.debug("SplashPage-页面每次显示时触发");
  // }
  // onPageHide(){
  // // 页面每次隐藏时触发一次。
  //   console.debug("SplashPage-页面每次隐藏时触发");
  // }
  onBackPress(){
  //   当用户点击返回按钮时触发。（是手机下方的返回按钮，不是页面的路由返回）
    console.debug("SplashPage-当用户点击物理返回按钮时触发");
  }

  //对于@Component装饰器装饰的组件，就代表一个组件
  // 组件的生命周期函数
  aboutToAppear(){
  //   组件即将出现时执行
    console.debug("SplashPage-组件即将出现时执行");
    this.timeId = setInterval(() => {
      if (this.countDownSeconds == 0) {
        this.jumpToAppHomePage();
      } else {
        this.countDownSeconds--;
      }
    }, 1000);
  }
  aboutToDisappear(){
  //   组件即将销毁时执行
    console.debug("SplashPage-组件即将销毁时执行");
    router.clear();
    clearInterval(this.timeId);
  }

  jumpToAppHomePage() {
    // router.pushUrl({
    //   url: 'pages/Index'
    // }).catch((error: Error) => {
    //   Logger.error('MainPage', 'MainPage pushUrl error ' + JSON.stringify(error));
    // });

    // 跳转到主页面
    ZRouter.getInstance().push(Routes.MAIN_PAGE)
    ZRouter.getInstance().removeByName(Routes.SPLASH_PAGE)
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Text($r('app.string.advertising_text_title', this.countDownSeconds))
            .textAlign(TextAlign.Center)
            .fontSize(12)
            .fontColor(0xCCCCCC)
            .margin({ top: 36 })
            .padding(8)
            .height(36)
            .width(100)
            .borderRadius(16)
            .border({ color: 0xCCCCCC, width: 1 })
            .onClick(() => this.jumpToAppHomePage())
        }
        .width('90%')
        .justifyContent(FlexAlign.End)
      }
      .width('100%')
      .height('100%')
      .backgroundImagePosition({x: 0, y: 0})
      .backgroundImage($r('app.media.ic_splash_bg'))
      .backgroundImageSize({ width: '100%', height: '100%' })
      .expandSafeArea()
    }.hideTitleBar(true)
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)

  }
}