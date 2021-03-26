final data = {
  "name": "Leanne",
  "last_name": "Graham",
  "email": "sincere@april.biz",
  "birthdate": "1995-03-13"
};

/*

[
  {
    name: "january",
    movements: [
      '{{repeat(2, 5)}}',
      {
        id: '{{objectId()}}',
        value: '{{ floating(1, 2000, 2) }}',
        type: '{{ random( "entry", "exit", "entry",  ) }}',
        date: '{{ date( new Date(2021, 1, 1), date(new Date(2021, 1, 28)) ) }}'
      }
    ]
  },
  {
    name: "february",
    movements: [
      '{{repeat(2, 5)}}',
      {
        id: '{{objectId()}}',
        value: '{{ floating(1, 2000, 2) }}',
        type: '{{ random( "entry", "exit", "entry" ) }}',
        date: '{{ date( new Date(2021, 2, 1), date(new Date(2021, 2, 28)) ) }}'
      }
    ]
  },
  {
    name: "march",
    movements: [  
    '{{repeat(1, 5)}}',
    {
      id: '{{objectId()}}',
      value: '{{ floating(1, 2000, 2) }}',
      type: '{{ random( "entry", "exit", "entry" ) }}',
      date: '{{ date( new Date(2021, 4, 1), date(new Date(2021, 4, 30)) ) }}'
    }
    ]
  }
]

*/

final yearMovements = [
  {
    "name": "january",
    "movements": [
      {
        "id": "605ac1cb5afab8c8e307d07b",
        "value": 1976.74,
        "type": "entry",
        "date": "Sat Mar 06 2021 22:03:38 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cb31a97105717a3a3f",
        "value": 1616.61,
        "type": "entry",
        "date": "Thu Feb 18 2021 03:40:25 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cb1f6b89e9d37fb771",
        "value": 450.25,
        "type": "entry",
        "date": "Wed Feb 03 2021 08:04:48 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cb7c91e0673f14a302",
        "value": 1255.05,
        "type": "entry",
        "date": "Tue Mar 02 2021 03:54:01 GMT-0600 (CST)"
      }
    ]
  },
  {
    "name": "february",
    "movements": [
      {
        "id": "605ac1cb893eda6fc016e8a3",
        "value": 1043.79,
        "type": "entry",
        "date": "Fri Mar 12 2021 21:14:42 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cb85ac5e687891fa9d",
        "value": 1012.86,
        "type": "entry",
        "date": "Wed Mar 24 2021 20:44:36 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cbbfa9040dd04f7ade",
        "value": 54,
        "type": "entry",
        "date": "Fri Mar 19 2021 02:54:13 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cb5fc1bce1ce1183fd",
        "value": 801.36,
        "type": "entry",
        "date": "Tue Mar 23 2021 07:42:27 GMT-0600 (CST)"
      },
      {
        "id": "605ac1cb053a9e362fbed09d",
        "value": 334.34,
        "type": "entry",
        "date": "Mon Mar 15 2021 08:44:33 GMT-0600 (CST)"
      }
    ]
  },
  {
    "name": "march",
    "movements": [
      {
        "id": "605ac1cb326a370fee78f084",
        "value": 1854.91,
        "type": "entry",
        "date": "Thu May 13 2021 17:54:54 GMT-0500 (CDT)"
      }
    ]
  }
];

/*
https://www.json-generator.com

[
  '{{repeat(2, 17)}}',
  {
    id: '{{objectId()}}',
    value: '{{ floating(1, 2000, 2) }}',
    type: '{{ random( "entry", "exit", "entry" ) }}',
    date: '{{ date( new Date(2021, 3, 2), date(new Date(2021, 3, 2)) ) }}',
    
  }
]

*/

final movements = [
  {
    "id": "60582f48cf3bd18a067c58f4",
    "value": 1325.81,
    "type": "entry",
    "date": "Thu Apr 01 2021 12:44:06 GMT-0600 (CST)"
  },
  {
    "id": "60582f480ea86ba12d2f2c32",
    "value": 285.07,
    "type": "entry",
    "date": "Mon Mar 29 2021 00:33:55 GMT-0600 (CST)"
  },
  // {
  //   "id": "60582f4807f4f641e203aa97",
  //   "value": 507.63,
  //   "type": "exit",
  //   "date": "Tue Mar 30 2021 21:48:41 GMT-0600 (CST)"
  // },
  // {
  //   "id": "60582f4847ead4c734a87ebb",
  //   "value": 1183.36,
  //   "type": "exit",
  //   "date": "Mon Mar 29 2021 01:22:49 GMT-0600 (CST)"
  // },
  {
    "id": "60582f4843dcb62e92b20e2f",
    "value": 540.41,
    "type": "exit",
    "date": "Wed Mar 31 2021 11:15:03 GMT-0600 (CST)"
  },
  {
    "id": "60582f48bc76842031039a2c",
    "value": 764.92,
    "type": "entry",
    "date": "Sat Mar 27 2021 13:33:46 GMT-0600 (CST)"
  },
  {
    "id": "60582f4801f826dd5b1f3f7b",
    "value": 597.63,
    "type": "exit",
    "date": "Thu Apr 01 2021 20:34:48 GMT-0600 (CST)"
  },
  {
    "id": "60582f48b271f7b3a68d786b",
    "value": 1706.46,
    "type": "exit",
    "date": "Thu Apr 01 2021 10:26:26 GMT-0600 (CST)"
  },
  {
    "id": "60582f48309c6306a6f79a10",
    "value": 282.99,
    "type": "exit",
    "date": "Tue Mar 30 2021 01:11:25 GMT-0600 (CST)"
  },
  {
    "id": "60582f484bbb75a8a08b3315",
    "value": 895.26,
    "type": "entry",
    "date": "Thu Mar 25 2021 12:45:29 GMT-0600 (CST)"
  },
  {
    "id": "60582f48b28d872c15e3bbc2",
    "value": 1033.06,
    "type": "entry",
    "date": "Wed Mar 31 2021 12:34:49 GMT-0600 (CST)"
  },
  {
    "id": "60582f48aaeaaa31dc88eb4c",
    "value": 1485.99,
    "type": "entry",
    "date": "Mon Mar 29 2021 18:25:04 GMT-0600 (CST)"
  },
  {
    "id": "60582f48d79887942e65a510",
    "value": 1598.16,
    "type": "entry",
    "date": "Thu Apr 01 2021 21:17:20 GMT-0600 (CST)"
  },
  {
    "id": "60582f481bef908d38297708",
    "value": 433.02,
    "type": "entry",
    "date": "Sun Mar 28 2021 23:50:21 GMT-0600 (CST)"
  },
  {
    "id": "60582f4826893aa7be03aaaf",
    "value": 1948.23,
    "type": "exit",
    "date": "Thu Mar 25 2021 08:11:31 GMT-0600 (CST)"
  }
];
//
//
//

/*  
    date: '{{ integer(1, 31) }}-{{ function(){ return integer(2, 12) }}',
    json-genertor secuncial data
    function(indexObject){
      var myArray = ["A","B","C","D","E","F","G","H","I","J"];
      var currentIndex = indexObject.currentIndex;
      return myArray[currentIndex];
    }
    
*/
/*

[
  '{{repeat(2, 7)}}',
  {
    index: '{{ index()+1 }}',
    id: '{{objectId()}}',
    value: '{{ random(100,500,100,2000,3000,5000, 6000) }}',
    name: '{{ lorem(random(1,3), "words") }}',
    interest_rate: '{{ random( 0.05, 0.06, 0.075, 0.11, 0.12 ) }}',
    date: '{{ date( new Date(2020, 5, 2), date(new Date(2021, 3, 2) ), "dd-MM-YYYY" ) }}',
    expiration_time: '{{ random( 30, 60, 90, 180, 360 ) }}'
  }
]

*/

const investments = [
  {
    "index": 1,
    "id": "605abd85e4c73c4b0863ccb2",
    "value": 2000,
    "name": "aliqua",
    "interest_rate": 0.11,
    "date": "22-12-2020",
    "expiration_time": 60
  },
  {
    "index": 2,
    "id": "605abd858ef117c89fe70bc4",
    "value": 5000,
    "name": "dolor",
    "interest_rate": 0.12,
    "date": "27-09-2020",
    "expiration_time": 360
  },
  {
    "index": 3,
    "id": "605abd857b01c0671c0e5696",
    "value": 100,
    "name": "reprehenderit ipsum eiusmod",
    "interest_rate": 0.11,
    "date": "25-11-2020",
    "expiration_time": 180
  },
  {
    "index": 4,
    "id": "605abd85b6da859761307f8f",
    "value": 3000,
    "name": "voluptate laboris mollit",
    "interest_rate": 0.05,
    "date": "31-07-2020",
    "expiration_time": 90
  },
  {
    "index": 5,
    "id": "605abd8595a231b335021f8a",
    "value": 2000,
    "name": "duis et incididunt",
    "interest_rate": 0.12,
    "date": "26-01-2021",
    "expiration_time": 60
  },
  {
    "index": 6,
    "id": "605abd85253c9ceb385f2544",
    "value": 6000,
    "name": "commodo do reprehenderit",
    "interest_rate": 0.075,
    "date": "11-08-2020",
    "expiration_time": 30
  },
  {
    "index": 7,
    "id": "605abd8534bdc574311e874d",
    "value": 5000,
    "name": "ex",
    "interest_rate": 0.11,
    "date": "07-03-2021",
    "expiration_time": 30
  }
];
