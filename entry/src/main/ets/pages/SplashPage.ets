import router from '@ohos.router'
@Entry
@Component
struct SplashPage {
  // @Entry装饰器装饰的组件，就代表一个页面
  ///页面的生命周期函数
  onPageShow(){
  // 页面每次显示时触发。
    console.debug("页面每次显示时触发");
  }
  onPageHide(){
  // 页面每次隐藏时触发一次。
    console.debug("页面每次隐藏时触发");
  }
  onBackPress(){
  //   当用户点击返回按钮时触发。（是手机下方的返回按钮，不是页面的路由返回）
    console.debug("当用户点击物理返回按钮时触发");
  }

  //对于@Component装饰器装饰的组件，就代表一个组件
  // 组件的生命周期函数
  aboutToAppear(){
  //   组件即将出现时执行
    console.debug("组件即将出现时执行");
  }
  aboutToDisappear(){
  //   组件即将销毁时执行
    console.debug("组件即将销毁时执行");
  }

  build() {
    Column() {
      Row() {
        Text("跳过")
          .textAlign(TextAlign.Center)
          .fontSize(12)
          .fontColor(0xCCCCCC)
          .margin({ top: 36 })
          .padding(8)
          .height(36)
          .width(100)
          .borderRadius(16)
          .border({ color: 0xCCCCCC, width: 1 })
          .onClick(() => this.goToHomePage())
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
  }

  goToHomePage() {
    router.replaceUrl({ url: 'pages/MainPage' });
  }
}