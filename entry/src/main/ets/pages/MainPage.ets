import Conversation from '../view/Conversation';
import Discover from '../view/Discover';
import Home from "../view/Home"
import Me from '../view/Me';

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0;
  private  tabsController: TabsController = new TabsController();

  @Builder TabBuilder( index: number,  _name: Resource) {
    Column() {
      Image(this.currentIndex === index ?  BottomTabsList[index].iconSelected : BottomTabsList[index].icon)
        .width("25%")
        .height("25%")
        .objectFit(ImageFit.Contain)

      Text(BottomTabsList[index].text)
        .margin({ top: 4})
        .fontSize('14fp')
        .fontColor(this.currentIndex === index ? 0xFF1698CE : 0xFF6B6B6B)
    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#F1F3F5")
    .height("100%")
    .width("100%")
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({
        barPosition:BarPosition.End,
        controller:this.tabsController
      }){
        TabContent(){
          Home()
        }
        .padding({left:12,right:12})
        .tabBar(this.TabBuilder(0,$r("app.string.tab_home")))

        TabContent(){
          Discover()
        }.padding({left:12,right:12})
        .tabBar(this.TabBuilder(1,$r('app.string.tab_discover')))

        TabContent(){
          Conversation()
        }.padding({left:12,right:12})
        .tabBar(this.TabBuilder(2,$r('app.string.tab_message')))

        TabContent(){
          Me()
        }.padding({left:12,right:12})
        .tabBar(this.TabBuilder(3,$r('app.string.tab_me')))
      }
      .width("100%")
      .height("100%")
      .backgroundColor(Color.White)
      .barHeight("10%")
      .barMode(BarMode.Fixed)
      .onChange((index:number) =>{
        console.debug("index = %@",index);
        this.currentIndex = index;
      })
      .scrollable(false)
      .vertical(false)
      .animationDuration(200)
    }.width("100%")

  }

}

export const BottomTabsList: Array<BottomTabsItem> = [
  {
    icon: $r('app.media.ic_tab_home_normal'),
    iconSelected: $r('app.media.ic_tab_home_selected'),
    text: '首页'
  },
  {
    icon: $r('app.media.ic_tab_discover_normal'),
    iconSelected: $r('app.media.ic_tab_discover_selected'),
    text: "发现"
  },
  {
    icon: $r('app.media.ic_tab_conversation_normal'),
    iconSelected: $r('app.media.ic_tab_conversation_selected'),
    text: "消息"
  },
{
    icon: $r('app.media.ic_tab_me_normal'),
    iconSelected: $r('app.media.ic_tab_me_selected'),
    text: "我的"
  }
]

export interface BottomTabsItem {
  icon: Resource;
  iconSelected: Resource;
  text: string;
}