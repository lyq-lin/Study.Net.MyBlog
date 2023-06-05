using AlibabaCloud.OpenApiClient.Models;
using AlibabaCloud.SDK.Dysmsapi20170525;
using AlibabaCloud.SDK.Dysmsapi20170525.Models;
using AlibabaCloud.TeaUtil;
using AlibabaCloud.TeaUtil.Models;
using Tea;

namespace Study.Net.Utility
{
    public class SMSHelper
    {
        /**
       * 使用AK&SK初始化账号Client
       * @param accessKeyId
       * @param accessKeySecret
       * @return Client
       * @throws Exception
       */
        public static Client CreateClient(string accessKeyId, string accessKeySecret)
        {
            Config config = new Config
            {
                // 必填，您的 AccessKey ID
                AccessKeyId = accessKeyId,
                // 必填，您的 AccessKey Secret
                AccessKeySecret = accessKeySecret,
            };
            // 访问的域名
            config.Endpoint = "dysmsapi.aliyuncs.com";
            return new Client(config);
        }

        public static void UseSMS(string phone, string token)
        {
            Client client = CreateClient(@$"你的密钥", $@"你的安全密钥");

            SendSmsRequest sendSmsRequest = new SendSmsRequest
            {
                PhoneNumbers = phone,
                SignName = "模板_Code",
                TemplateCode = "SMS_461085642", //模板Code
                TemplateParam = $"{{\"code\":\"{token}\"}}",
            };
            try
            {
                // 复制代码运行请自行打印 API 的返回值
                client.SendSmsWithOptionsAsync(sendSmsRequest, new RuntimeOptions());
            }
            catch (TeaException error)
            {
                // 如有需要，请打印 error
                Common.AssertAsString(error.Message);
            }
            catch (Exception _error)
            {
                TeaException error = new TeaException(new Dictionary<string, object>
              {
                  { "message", _error.Message }
              });
                // 如有需要，请打印 error
                Common.AssertAsString(error.Message);
            }
        }
    }
}
