application-druid.yml
    url: jdbc:mysql://127.0.0.1:3306/kwswitch?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: 123

------------
$ npm run dev
http://localhost/login
user: admin
pass: admin123

--------------
MySQL Server 5.5

DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
->
DEFAULT NULL CURRENT_TIMESTAMP

https://blog.csdn.net/qq_39769369/article/details/81565103
因为MYSQL 5.5不支持字段类型为datetime且默认值为NOW()的建表语句
同时，也不支持CURRENT_TIMESTAMP:datetime DEFAULT CURRENT_TIMESTAMP
解决方法：timestamp DEFAULT NOW()
但是：mysql5.6支持datetime DEFAULT NOW()

  `update_time` timestamp DEFAULT NOW(),
not good--->  `create_time` timestamp NOT NULL DEFAULT 0 COMMENT '添加时间',

----------------

com/ruoyi/project/kwswitch/mqtt/MqttSenderConfig.java

tcp://192.168.0.110:1883
mosquitto
EMQ (Erlang/Enterprise/Elastic MQTT Broker)

https://blog.csdn.net/qq_27600345/article/details/80741284
MqttConnectOptions mqttConnectOptions = new MqttConnectOptions();
//断开后，是否自动连接
mqttConnectOptions.setAutomaticReconnect(true);
//是否清空客户端的连接记录。若为true，则断开后，broker将自动清除该客户端连接信息
mqttConnectOptions.setCleanSession(false);
//设置超时时间，单位为秒
//mqttConnectOptions.setConnectionTimeout(2);
//心跳时间，单位为秒。即多长时间确认一次Client端是否在线
//mqttConnectOptions.setKeepAliveInterval(2);
//允许同时发送几条消息（未收到broker确认信息）
//mqttConnectOptions.setMaxInflight(10);

---------
关闭mqtt功能和报错日志

MqttPahoMessageDrivenChannelAdapter

com/ruoyi/project/kwswitch/mqtt/MqttReceiverConfig.java
    /**
     * MQTT消息订阅绑定（消费者）
     */
-->    //@Bean
    public MessageProducer inbound() {

    }
-------------
关闭mongodb自动连接
https://www.cnblogs.com/yingkamen/p/10233866.html

这种办法不可行，会导致bean创建失败
@SpringBootApplication(exclude = {
        DataSourceAutoConfiguration.class,
-->        MongoAutoConfiguration.class,
-->        MongoDataAutoConfiguration.class
})

可行的方法：注释配置，即可关闭最初的连接
  data:
    #mongodb:
    #  host: mongo123
    #  port: 27017
    #  username: admin
    #  password: 123456
    #  database: kwswitch

-----------
关闭redis验证,SameUrlDataInterceptor,RepeatSubmitInterceptor

com/ruoyi/framework/config/ResourcesConfig.java
@Configuration
public class ResourcesConfig implements WebMvcConfigurer
{
//    @Autowired
//    private RepeatSubmitInterceptor repeatSubmitInterceptor;
...

    /**
     * 自定义拦截规则
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry)
    {
//        registry.addInterceptor(repeatSubmitInterceptor).addPathPatterns("/**");
    }

-----------
注释所有RedisCache操作

@RestController
public class CaptchaController
{
    //@Autowired
    //private RedisCache redisCache;

//        redisCache.setCacheObject(verifyKey, verifyCode, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);


--------------------------

@Component
public class SysLoginService
{
    @Autowired
    private TokenService tokenService;

    @Resource
    private AuthenticationManager authenticationManager;

//    @Autowired
//    private RedisCache redisCache;

    public String login(String username, String password, String code, String uuid)
    {
//        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
//        String captcha = redisCache.getCacheObject(verifyKey);
//        redisCache.deleteObject(verifyKey);
//        if(!code.equals("kwswitch")) {
//            if (captcha == null) {
//                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
//                throw new CaptchaExpireException();
//            }
//            if (!code.equalsIgnoreCase(captcha)) {
//                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
//                throw new CaptchaException();
//            }
//        }
--------------
redis即缓存验证码信息，也缓存登陆用户信息（检查超时，监控在线用户）


@Component
public class TokenService
{

//    @Autowired
//    private RedisCache redisCache;
    private Map<String, LoginUser> redisCacheMap = new HashMap<>();

-------------
mongodb用于mqtt日志
