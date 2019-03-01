
 WxMpKefuMessage.WxArticle article1 = new WxMpKefuMessage.WxArticle();
            article1.setUrl("URL");
            article1.setPicUrl("PIC_URL");
            article1.setDescription("Is Really A Happy Day");
            article1.setTitle("Happy Day");

            WxMpKefuMessage.NEWS()
                    .toUser("OPENID")
                    .addArticle(article1)
                    .build();



            sendKefuMessage(WxMpKefuMessage
                    .TEXT()
                    .toUser(superiorOpenId)
                    .content("您有一条报告消息,请及时查收 !")
                    .build());


WxMpTemplateMessage templateMessage = WxMpTemplateMessage.builder()
      .toUser(configStorage.getOpenid())
      .templateId(configStorage.getTemplateId())
      .url(" ")
      .build();


 WxMpKefuMessage.WxArticle article1 = new WxMpKefuMessage.WxArticle();
            article1.setUrl("URL");
            article1.setPicUrl("http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er1b1ZPmMGsEzygbFajtrcuzTW8fLoQicibgTq5J5OXRDbuSWPVZen4sKV0wrxpapmCyo0UVxBBXYEQ/132");
            article1.setDescription("您收到一条总结报告,请及时查收 !");
            article1.setTitle("新通知");
            sendKefuMessage(WxMpKefuMessage
                    .NEWS()
                    .toUser(superiorOpenId)
                    .addArticle(article1)
                    .build());



@Configuration
@PropertySource(value = "file:${user.dir}/config/customize.properties", ignoreResourceNotFound = true)
public class InitCustomizeUrlConfig {

