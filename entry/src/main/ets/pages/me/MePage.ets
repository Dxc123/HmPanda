
import { ZRouter } from "@hzw/zrouter"
import { SmartDialog } from "ohos_smart_dialog"
import { Routes } from "../../routes/RouterConst"

@Preview
@Component
export struct MePage {
  private readonly titleArr: string[] = [
    "My like",
    "My Collection",
    "My attention",
    "Setting",
  ]
  private readonly imageArr: Resource[] = [
    $r("app.media.me_cell_like"),
    $r("app.media.me_cell_collection"),
    $r("app.media.me_cell_focus"),
    $r("app.media.me_cell_setting"),
  ]

  build() {
    Column({ space: 12 }) {
      Row() {
        Image($r("app.media.me_logo"))
          .width(50)
          .height(50)
          .borderRadius(25)
          .margin({ left: 10, right: 10 })
        Column() {
          Text("NikiName:Jack")
            .fontColor(Color.Black)
            .fontSize(16)
            .margin({ bottom: 8 })
          Text("ID:23488800")
            .fontColor(Color.Black)
            .fontSize(16)
        }
        .alignItems(HorizontalAlign.Start)
      }
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })
      .height(100)
      .width("100%")
      .borderRadius(16)

      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.titleArr, (item: string, index: number) => {
          ListItem() {
            Row({space:10}) {
              Row({space:10}) {
                Image( this.imageArr[index])
                  .width(30)
                  .width(30)
                  .objectFit(ImageFit.Cover)

                Text(item)
                  .width('100%')
                  .height(50)
                  .fontSize(16)
                  .textAlign(TextAlign.Start)
              }
              .justifyContent(FlexAlign.Start)

              Image($r("app.media.me_cell_arrow_right"))
                .width(20)
                .height(20)
                .objectFit(ImageFit.Cover)
                .margin({ right: 10 })
            }
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
            .padding({ left: 10, right: 10 })
            .justifyContent(FlexAlign.SpaceEvenly)
            .onClick(() => {
              console.debug(`点击index = ${index}`);
              if (index == 0) {
                ZRouter.getInstance()
                  .setParam("携带参数")
                  .setPopListener((info) => {
                    console.debug(`popListener返回监听 =${info}`);
                  })
                  .push(Routes.MINE_LIKE_VIEW)
              } else if (index == 1) {
                ZRouter.getInstance().push(Routes.MINE_COLLECTION_VIEW)
              } else if (index == 2) {
                ZRouter.getInstance().push(Routes.MINE_FOCUS_VIEW)
              }else if (index == 3) {
                ZRouter.getInstance().push(Routes.MINE_SETTING_VIEW)
                // SmartDialog.showLoading()
              }
            })
          }

        }, (item: string, index: number) => index + item)
      }
      .listDirection(Axis.Vertical)
      .margin({ top: 10 })
      .width("100%")

    }
    .height("100%")
    .backgroundColor(0xFFF6F7F8)
    .padding({ left: 10, right: 10 })
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .expandSafeArea()
  }
}