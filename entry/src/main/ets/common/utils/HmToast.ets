
import {  ToastUtil } from "@pura/harmony-utils";

export  class HmToast{
  static showToast(message: string | Resource) {
    ToastUtil.showToast(message)
  }
  static showShort(message: string | Resource) {
    ToastUtil.showShort(message)
  }
  static showLong(message: string | Resource) {
    ToastUtil.showLong(message)
  }
}