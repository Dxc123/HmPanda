@Component
export default struct Conversation {
  build(){
    Column({ space: 12 }) {
      Column() {
        Text("消息")
          .fontWeight(FontWeight.Medium)
          .fontSize(24)
          .margin({ top: 12 })
          .padding({ left: 12})
      }
      .width("100%")
      .alignItems(HorizontalAlign.Center)
    }
  }
}