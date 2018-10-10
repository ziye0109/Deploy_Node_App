const url = require('url');
const https = require('https');
const util = require('util');

const POST_OPTIONS = {
    hostname: 'hooks.slack.com',
    path: 'https://hooks.slack.com/services/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',
    method: 'POST',
  };

exports.handler = (event, context, callback) => {
    
    console.log(JSON.stringify(event));
    const stage = 'Code Build';
    const state = event.detail['build-status'];
    const title = stage +' '+state;
    
    const message = {
        channel: 'general',
        attachments: [
        {
            "color": state.toLowerCase()==='failed'?"#ff6347":"#36a64f",
            "pretext": state,
            "author_name": "ziye",
            "title": title,
            "title_link": "https://api.slack.com/",
            "text": state,
          
        }
    ]};
    const r = https.request(POST_OPTIONS, (res)=> {
                        res.setEncoding('utf8');
                        res.on('data',  (data) => context.succeed("Message Sent: " + data));
    }).on("error", e =>context.fail("Failed: " + e));
    r.write(util.format("%j", message));
    r.end();
};