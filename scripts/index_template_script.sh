curl -XPUT https://9501319dd82275995d734ff8d78cb16f.ap-southeast-2.aws.found.io:9243/_template/ballarat-town-planning-register-template -d '
{
  "order": 0,
  "template": "ballarat-town-planning-register",
  "mappings": {
    "_default_": {
      "properties": {
        "geometry": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            },
            "type": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "App_Number": {
          "type": "string",
          "index": "not_analyzed"
        },
        "App_Type": {
          "type": "multi_field",
          "fields": {
            "App_Type": {
              "type": "string"
            },
            "raw": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "App_Year": {
          "type": "Integer"
        },
        "Application_Date": {
          "type": "date",
          "format": "dateOptionalTime"
        },
        "Description": {
          "type": "multi_field",
          "fields": {
            "Description": {
              "type": "string"
            },
            "raw": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "Location": {
          "type": "multi_field",
          "fields": {
            "Location": {
              "type": "string"
            },
            "raw": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "Status": {
          "type": "string",
          "index": "not_analyzed"
        },
        "Ward": {
          "type": "string",
          "index": "not_analyzed"
        },
        "lat": {
          "type": "float"
        },
        "long": {
          "type": "float"
        },
        "propnum": {
          "type": "integer"
        }
      }
    }
  },
  "aliases": {}
}
'
