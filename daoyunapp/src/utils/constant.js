const USER_INFO_KEY = 'USER_INFO';
const LOCAL_STORAGE_PREFIX = 'Platform_';
const REQUEST_HEADER_TOKEN_KEY = 'token';
/**
 * REQUEST_ERROR_CODE 请求错误代码
 */
const ERROR_CODE_NOT_PERMISSION = 'NOT_PERMISSION';
const ERROR_CODE_NOT_LOGIN = 'NOT_LOGIN';
const ERROR_CODE_NETWORK_ERROR = 'ECONNABORTED';

export default {
  USER_INFO_KEY,
  LOCAL_STORAGE_PREFIX,
  ERROR_CODE_NOT_PERMISSION, // 没有权限
  ERROR_CODE_NOT_LOGIN, // 没有登录
  ERROR_CODE_NETWORK_ERROR, // 网络错误
  REQUEST_HEADER_TOKEN_KEY
}
