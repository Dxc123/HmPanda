import { Route } from "@hzw/zrouter";
import { Routes } from "../../../routes/RouterConst";

@Preview
@Component
@Route({ name: Routes.MINE_SETTING_VIEW, description: '设置页' })
export struct MeSettingPage {
  @State message: string = 'Hello World';
  build() {
    NavDestination() {
      RelativeContainer() {
        Text(this.message)
          .id('SettingPageHelloWorld')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick(() => {
            this.message = 'Welcome';
          })
      }
      .height('100%')
      .width('100%')
    }
    .hideTitleBar(true)

  }
}