import { ZRouter } from '@hzw/zrouter';
import { OhosSmartDialog } from 'ohos_smart_dialog';
import { CommonConstants } from '../../common/constants/CommonConstants';
import { GlobalNavigateInterceptor } from '../../routes/GlobalNavigateInterceptor';
import { Routes } from '../../routes/RouterConst';

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    // 添加拦截器
    ZRouter.setGlobalInterceptor(new GlobalNavigateInterceptor())
  }

  build() {
    Stack() {
      // 获取NavPathStack实例对象
      Navigation(ZRouter.getNavStack()) {
      }
      .onAppear(() => {
        // 跳转启页面
        ZRouter.getInstance().push(Routes.SPLASH_PAGE)
      })
      .hideTitleBar(true)
      .mode(NavigationMode.Stack)
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)

      // here dialog init
      OhosSmartDialog(
        {
          // custom global loading
          loadingBuilder: customLoading,
        }
      )
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}

@Builder
export function customLoading(args: ESObject) {
  LoadingProgress().width(80).height(80).color(Color.White)
}