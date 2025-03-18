import { HomePage } from "../home/HomePage"
import { DiscoverPage } from "../discover/DiscoverPage"
import { ConversationPage } from "../message/ConversationPage"
import { MePage } from "../me/MePage"
import { CommonConstants } from "../../common/constants/CommonConstants";
import { Route, ZRouter } from "@hzw/zrouter";
import { Routes } from "../../routes/RouterConst";
import { HmToast } from "../../common/utils/HmToast";
import { HmAppUntil } from "../../common/utils/HmAppUntil";

// 定义一个状态变量来记录上次点击返回键的时间
let lastBackPressedTime = 0

@Preview
@Component
@Route({ name: Routes.MAIN_PAGE })
export struct MainPage {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  aboutToAppear() {
    console.log(`xxx ： ---` + 'MainPage')
    console.log(`xxx获取参数 ： ---` + ZRouter.getInstance().getParamByName(Routes.MAIN_PAGE))
  }

  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
        Tabs({
          barPosition: BarPosition.End,
          controller: this.tabsController
        }) {
          TabContent() {
            HomePage()
          }
          .padding({ left: 12, right: 12 })
          .tabBar(this.TabBuilder(0, $r("app.string.tab_home")))

          TabContent() {
            DiscoverPage()
          }.padding({ left: 12, right: 12 })
          .tabBar(this.TabBuilder(1, $r('app.string.tab_discover')))

          TabContent() {
            ConversationPage()
          }.padding({ left: 12, right: 12 })
          .tabBar(this.TabBuilder(2, $r('app.string.tab_message')))

          TabContent() {
            MePage()
          }.padding({ left: 12, right: 12 })
          .tabBar(this.TabBuilder(3, $r('app.string.tab_me')))
        }
        .width("100%")
        .height("100%")
        .backgroundColor(Color.White)
        .barHeight("10%")
        .barHeight(56) //设置导航栏高度
        .barMode(BarMode.Fixed)
        .onChange((index: number) => {
          console.debug("index = %@", index);
          this.currentIndex = index;
        })
        .scrollable(false)
        .vertical(false)
        .animationDuration(200)
      }
      .width("100%")
    }
    .hideTitleBar(true)
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .onBackPressed(() => {
      console.debug("onBackPressed");
      const currentTime = new Date().getTime()
      const timeDifference = currentTime - lastBackPressedTime
      if (timeDifference < 2000) { // 2秒内再次点击
        //退出应用
        HmAppUntil.exit()
      } else {
        // 提示用户
        HmToast.showToast('再按一次退出应用')
        lastBackPressedTime = currentTime
      }
      return true
    })
  }

  @Builder
  TabBuilder(index: number, _name: Resource) {
    Column() {
      Image(this.currentIndex === index ? BottomTabsList[index].iconSelected : BottomTabsList[index].icon)
        .width("25%")
        .height("25%")
        .objectFit(ImageFit.Contain)

      Text(BottomTabsList[index].text)
        .margin({ top: 4 })
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
