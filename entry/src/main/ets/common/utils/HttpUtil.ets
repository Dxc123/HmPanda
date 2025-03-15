/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import http from '@ohos.net.http';
import { ResponseResult } from '../../viewmodel/NewsViewModel';
import { CommonConstants as Const, ContentType } from '../constants/CommonConstants';
import Logger from './Logger';


/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */
export function httpRequestGet(url: string): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: Const.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: Const.HTTP_READ_TIMEOUT,
    extraData: {}
  });
  let serverData: ResponseResult = new ResponseResult();
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === Const.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.code === Const.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `${"Network request failed, please try later!"}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.msg = "Network request failed, please try later!";
    return serverData;
  })
}


// ////////////////////////////

// ////////////////////////////
export function httpRequestGet22(url: string) {
  return httpRequest(url, http.RequestMethod.GET);
}
/*export function httpRequestGet(url: string, params?:string) {
  return httpRequest(url, http.RequestMethod.GET,params);
}*/

export function httpRequestPost(url: string, params?:string ) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

function httpRequest(url: string, method: http.RequestMethod,params?: string){
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: Const.HTTP_READ_TIMEOUT,//读取超时时间 可选，默认为60000ms
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: Const.HTTP_READ_TIMEOUT,//连接超时时间  可选，默认为60000ms
    extraData: params // 请求参数
  });
  return responseResult.then((value: http.HttpResponse)=>{
    Logger.error("请求状态 --> "+value.responseCode)
    if(value.responseCode===200){
      Logger.error("请求成功");
      let getresult = value.result;
      Logger.error('请求返回数据', JSON.stringify(getresult));
      return getresult;
    }
  }).catch((err)=>{
    httpRequest.off('headersReceive');
    // 当该请求使用完毕时，调用destroy方法主动销毁
    httpRequest.destroy();
    return "";
  });
}















