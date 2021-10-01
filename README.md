# Rectangles
Rectangle Repo

This exercise demonstrates implementing mocking to test a ViewController features
The API response is mocked as well as cached data is too

An app with a single screen where the user can drag rectangles. The first time that the app is open, it has to get the initial position and size of the rectangles from an API. If the user moves the rectangles, their last position has to be preserved even if the app is closed. 
If the last time the user used the app was more than a week ago, then the position and size should be fetched again from the API. 

```
{
    "rectangles": [
        {
            "x": 0.5,
            "y": 0.5,
            "size": 0.2
        },
        {
            "x": 0.7,
            "y": 0.7,
            "size": 0.2
        }
    ]
}
```
rectangles: list of rectangles.
x and y: position of the rectangle relative to the screen. E.g. x:0.5, y:0.5 means a rectangle in the center of the screen.
size: the size of the rectangle in percentage relative to the screen. E.g. size:0.1 means a width of 10% of the width of the screen and a height of 10% of the height of the screen.
