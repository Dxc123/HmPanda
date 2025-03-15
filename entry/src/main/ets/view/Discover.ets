@Component
export default struct Discover {
  build(){
    Column({ space: 12 }) {
      Column() {
        Text("发现")
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