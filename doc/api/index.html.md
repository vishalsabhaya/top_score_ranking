---
title: Top Score Ranking - API Documentation
language_tabs:
  - json: JSON
  - shell: cURL
---


# Scores

Create, read & delete scores

## Creating a score - errors


### Request

#### Endpoint

```plaintext
POST /api/scores
Content-Type: application/json
```

`POST /api/scores`

#### Parameters


```json
{
  "score": {
    "name": null,
    "score_point": "score",
    "score_at": "2021-09-20 12:00:00 JST"
  }
}
```


| Name | Description |
|:-----|:------------|
| score[name] *required* | Name of player |
| score[score_point] *required* | Score of player |
| score[score_at] *required* | Score time of player |



### Response

```plaintext
Content-Type: application/json; charset=utf-8
400 Bad Request
```


```json
{
  "errors": [
    {
      "code": 400001,
      "message": "can't be blank",
      "field": "name"
    },
    {
      "code": 400003,
      "message": "is not a number",
      "field": "score_point"
    },
    {
      "code": 400024,
      "message": "is invalid",
      "field": "score_at"
    }
  ]
}
```



```shell
curl "http://localhost:3000/api/scores" -d '{
  "score": {
    "name": null,
    "score_point": "score",
    "score_at": "2021-09-20 12:00:00 JST"
  }
}' -X POST \
	-H "Accept: application/json" \
	-H "Content-Type: application/json"
```
## Deleting an score


### Request

#### Endpoint

```plaintext
DELETE /api/scores/2
Content-Type: application/json
```

`DELETE /api/scores/:id`

#### Parameters


```json
{
}
```

None known.


### Response

```plaintext
Content-Type: application/json
200 OK
```




```shell
curl "http://localhost:3000/api/scores/2" -d '{
}' -X DELETE \
	-H "Accept: application/json" \
	-H "Content-Type: application/json"
```
