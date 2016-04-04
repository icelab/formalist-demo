require "json"

module FormalistDemo
  class Application < Rodakase::Application
    route "s3" do |r|
      r.is "presign" do
        r.post do
          {
            as: "file",
            id: "15a/7df/c68/15a7dfc6892b4a6ec8e8611a0a89722c6efcf22e3a52f61017bd08fbe013/fake-upload.png",
            url: "/s3/upload",
            fields: {
              key: "formalist-demo/15a/7df/c68/15a7dfc6892b4a6ec8e8611a0a89722c6efcf22e3a52f61017bd08fbe013/fake-upload.png",
              "Content-Type" => "image/png",
              acl: "public-read",
              policy: "eyJleHBpcmF0aW9uIjoiMjAxNi0wMy0yMVQwNDo1OToxOVoiLCJjb25kaXRpb25zIjpbeyJidWNrZXQiOiJjbWFnLWFuZC1ocCJ9LHsia2V5IjoiaGVyYWNsZXMtcHJvZHVjdGlvbi8xNWEvN2RmL2M2OC8xNWE3ZGZjNjg5MmI0YTZlYzhlODYxMWEwYTg5NzIyYzZlZmNmMjJlM2E1MmY2MTAxN2JkMDhmYmUwMTMvU2NyZWVuIFNob3QgMjAxNi0wMy0yMSBhdCAyLjU5LjExIFBNLnBuZyJ9LHsiQ29udGVudC1UeXBlIjoiaW1hZ2UvcG5nIn0seyJhY2wiOiJwdWJsaWMtcmVhZCJ9LHsieC1hbXotY3JlZGVudGlhbCI6IkFLSUFJVDJGWkM2M0s3TlVXUkZBLzIwMTYwMzIxL2FwLXNvdXRoZWFzdC0yL3MzL2F3czRfcmVxdWVzdCJ9LHsieC1hbXotYWxnb3JpdGhtIjoiQVdTNC1ITUFDLVNIQTI1NiJ9LHsieC1hbXotZGF0ZSI6IjIwMTYwMzIxVDAzNTkxOVoifV19",
              "x-amz-credential" => "AKIAIT2FZC63K7NUWRFA/20160321/ap-southeast-2/s3/aws4_request",
              "x-amz-algorithm" => "AWS4-HMAC-SHA256",
              "x-amz-date" => "20160321T035919Z",
              "x-amz-signature" => "6895741d474fa242ea83b32ee974793160b271fdc04b772f28596e4450381b13"
            }
          }
        end
      end
      r.is "upload" do
        r.post do
          sleep 5
          {success: true}
        end
      end
      r.is "persist" do
        r.post do
          sleep 5
          {
            "upload": {
              "id": 123,
              "file_name": "fake-upload.pdf",
              "content_type": "image/png",
              "original_path": "formalist-demo/15a/7df/c68/15a7dfc6892b4a6ec8e8611a0a89722c6efcf22e3a52f61017bd08fbe013/fake-upload.png",
              "original_url": "/upload/formalist-demo/15a/7df/c68/15a7dfc6892b4a6ec8e8611a0a89722c6efcf22e3a52f61017bd08fbe013/fake-upload.png",
              "created_at": "2016-03-21T15:02:58.541+11:00"
            }
          }
        end
      end
    end

    route "demo" do |r|
      r.get do
        r.is to: "views.demo"
      end

      r.post do
        r.resolve "operations.submit_demo" do |submit_demo|
          submit_demo.(r[:data]).match do |m|
            m.success do
              r.redirect "/demo"
            end

            m.failure do |result|
              r.resolve "views.demo" do |view|
                view.(result: result)
              end
            end
          end
        end
      end
    end
  end
end
