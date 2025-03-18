import { IGlobalNavigateInterceptor, InterceptorInfo, ZRouter } from "@hzw/zrouter"
import { promptAction } from "@kit.ArkUI"

export class GlobalNavigateInterceptor implements  IGlobalNavigateInterceptor{
  onRootWillShow?: ((fromContext: NavDestinationContext) => void) | undefined = (fromContext) => {
    console.log("IInterceptor Global onRootWillShow: ", fromContext.pathInfo.name)
  }
  onPageWillShow?: ((fromContext: NavDestinationContext, toContext: NavDestinationContext) => void) | undefined = (from ,to)=>{
    console.log("IInterceptor Global onPageWillShow: ", from, to.pathInfo.name, to.pathInfo.param)
  }

  onNavigate?: ((context: InterceptorInfo) => void) | undefined = (info)=>{
    if (info.notRegistered) return
    console.log("IInterceptor Global onNavigate: ", info.name)

    let isLogin = AppStorage.get<boolean>("isLogin")
    if (info.isNeedLogin && !isLogin) {
      let param = info.param
      // ZRouter.getInstance().redirectForResult2("LoginPage", param,(data) => {
      //
      // })
      ZRouter.redirectForResult2<boolean>("LoginPage", param, (data) => {
        if (data.data) {
          // 登录成功
          promptAction.showToast({ message: `登录成功` })
          return true // 返回true 则继续跳转登录前的页面
        }
        return false
      })
    }

  }
}


