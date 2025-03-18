
import http from '@ohos.net.http';
import { ResponseResult } from '../../viewmodel/NewsViewModel';
import { CommonConstants as Const, ContentType } from '../constants/CommonConstants';
import Logger from './Logger';
import { BusinessError } from '@kit.BasicServicesKit';


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
export function httpRequestGet22(url: string): Promise<string | Object | undefined> {
  return httpRequest(url, http.RequestMethod.GET);
}

/*export function httpRequestGet(url: string, params?:string) {
  return httpRequest(url, http.RequestMethod.GET,params);
}*/

export function httpRequestPost(url: string, params?: string): Promise<string | Object | undefined> {
  return httpRequest(url, http.RequestMethod.POST, params);
}

function httpRequest(url: string, method: http.RequestMethod, params?: string): Promise<string | Object | undefined> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: Const.HTTP_READ_TIMEOUT, // 读取超时时间 可选，默认为60000ms
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: Const.HTTP_READ_TIMEOUT, // 连接超时时间 可选，默认为60000ms
    extraData: params // 请求参数
  });

  return responseResult
    .then((value: http.HttpResponse) => {
      Logger.error("请求状态 --> " + value.responseCode);
      if (value.responseCode === 200) {
        Logger.error("请求成功");
        let getresult = value.result;
        Logger.error('请求返回数据', JSON.stringify(getresult));
        return getresult; // 返回成功结果
      } else {
        Logger.error(`请求失败，状态码：${value.responseCode}`);
        return `Request failed with status code ${value.responseCode}`; // 返回错误信息
      }
    })
    .catch((err: BusinessError) => {
      Logger.error("请求异常", err.message);
      httpRequest.off('headersReceive');
      httpRequest.destroy(); // 主动销毁请求
      return "Network request failed, please try later!"; // 返回默认错误信息
    });
}














