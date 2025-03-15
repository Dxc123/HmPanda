@Component
export default struct Me {
  private titleArr: string[] = ["0", "1", "2", "3", ]
  build(){
    Scroll(){
      Column({ space: 12 }) {
        Column() {
          Text("我的")
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12})
        }
        .width("100%")
        .alignItems(HorizontalAlign.Center)

        Row(){
          Image($r("app.media.me_logo"))
            .width(50)
            .height(50)
            .borderRadius(25)
            .margin({left:10,right:10})

          Column(){
            Text("NikiName:Jack")
              .fontColor(Color.Black)
              .fontSize(16)
              .margin({bottom:8})
            Text("ID:23488800")
              .fontColor(Color.Black)
              .fontSize(16)
          }
          .alignItems(HorizontalAlign.Start)

        }
        .backgroundColor(Color.White)
        .padding({left:10,right:10})
        .height(100)
        .width("100%")
        .borderRadius(16)

        List({space:10,initialIndex:0}){
          ForEach(this.titleArr,(item: string, index: number) =>{
            ListItem(){
              Text(`${index}`+item)
                .width('100%')
                .height(50)
                .fontSize(16)
                .textAlign(TextAlign.Start)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
                .padding({left:10,right:10})
            }

          },(item: string, index: number) => index + item)
        }

      }
      .height("100%")
      .backgroundColor(0xFFF6F7F8)
      .padding({left:10,right:10})
    }

  }
}