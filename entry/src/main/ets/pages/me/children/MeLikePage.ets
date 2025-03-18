import { LifecycleState, Route, ZRouter } from "@hzw/zrouter";
import { Routes } from "../../../routes/RouterConst";
import WindowUtils from "../../../common/utils/WindowUtils";
import { ToastUtil } from "@pura/harmony-utils";

@Preview
@Component
@Route({ name: Routes.MINE_LIKE_VIEW, description: '喜欢页' ,needLogin:false})
export struct MeLikePage {
  private keyword: string = ""
  // 定义一个状态变量来记录上次点击返回键的时间
  private lastBackTime = 0
  aboutToAppear() {
    console.debug("MeLikePage aboutToAppear")
    // 获取参数
       console.debug(`获取参数= ${ZRouter.getInstance().getParamByName(Routes.MINE_LIKE_VIEW)}`)
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Image($r("app.media.ic_back"))
            .width(48)
            .height(48)
            .padding(14)
            .objectFit(ImageFit.Contain)
            .fillColor(Color.Black)
            .onClick((event) => {
              console.debug("MeLikePage 返回")
              ZRouter.getInstance().popWithResult({
                data: {
                  "keyword": "我是登录页返回的数据"
                }
              })
            })

          Text("MeLikePage")
        }
        .width('100%')
        .height(WindowUtils.statusBarHeight + 'px')

      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)

  }
}
