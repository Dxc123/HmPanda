import router from '@ohos.router'
@Entry
@Component
struct LoginPage {
  @State account: string = '';
  @State password: string = '';
  @State isShowProgress: boolean = false;
  controller: TextInputController = new TextInputController();

  build() {
    Column() {
      Image($r("app.media.ic_logo"))
        .width(100)
        .height(100)
        .margin({
          top:120,
          bottom:20
        })
      Text("HmPanda")
        .fontColor(0xFF894DFF)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)

      TextInput({
        text: this.account,
        controller:this.controller,
        placeholder:"输入账号",
      })
        .placeholderColor(0xFFBBBBBB)
        .fontColor(0xFF000000)
        .height(50)
        .margin({
          top:20,
          bottom:20,
        })
        .onChange((value:string) =>{
          // this.account =  value
        })
        .type(InputType.PhoneNumber)
      TextInput({
        text: this.account,
        controller:this.controller,
        placeholder:"输入密码",
      })
        .placeholderColor(0xFFBBBBBB)
        .fontColor(0xFF000000)
        .height(50)
        .margin({
          top:20,
          bottom:20,
        })
        .onChange((value:string) =>{
          // this.account =  value
        })
        .showPasswordIcon(true)
        .type(InputType.Password)
      Button("登录",{type: ButtonType.Capsule})
        .fontColor(0xFF000000)
        .height(50)
        .width(200)
        .onClick(() => {
          console.log('登录')
        })

    }
    .backgroundColor('app.color.background')
    .width('100%')
    .height('100%')
    .padding({
      left:20,
      right:20,
      bottom: 20,
    })




  }

  goToHomePage() {
    router.replaceUrl({ url: 'pages/MainPage' });
  }
}