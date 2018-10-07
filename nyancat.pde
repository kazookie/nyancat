Oruyanke oruyanke = null;
Rainbow rainbow = null;
Star[] stars = new Star[10];

/**
 * Setup
 */
void setup() {
  size(640, 480);
  smooth();

  // Create star instance
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(random(width), random(height));
  }
  
  // Create rainbow instance
  rainbow = new Rainbow();
  
  // Create oruyanke instance
  oruyanke = new Oruyanke();
}


/**
 * Draw
 *
 */
void draw() {
  background(1, 51, 102);
  
  rainbow.update();
  rainbow.display();
  
  for (Star star: stars) {
    star.update();
    star.display();
  }
  
  oruyanke.update();
  oruyanke.display();
  
   //saveFrame("frames/oruyanke-######.png");
  
}

/**
 * Star
 *
 */
class Star {
  float x;
  float y;
  int index;
  PImage[] image = new PImage[6];
  
  Star(float x, float y) {
    image[0] = loadImage("star_anime0000.gif");
    image[1] = loadImage("star_anime0001.gif");
    image[2] = loadImage("star_anime0002.gif");
    image[3] = loadImage("star_anime0003.gif");
    image[4] = loadImage("star_anime0004.gif");
    image[5] = loadImage("star_anime0005.gif");
    
    this.x = x;
    this.y = y;
    index = int(random(image.length));
  }
  
  void update() {
    // Animetion increment
    if (frameCount % 10 == 0) {
      if(index < image.length - 1) {
        index++;
      }
      else {
        index = 0;
      }
    }
    
    // Image position
    if (x < -25) {
      x = width;
    }
    else {
      x -= 10;
    }
  }
  
  void display() {
    image(image[index], x, y);
  }
}

/**
 * Rainbow
 *
 */
class Rainbow {
  float x;
  float y;
  int index;
  PImage[] image = new PImage[2];
  
  Rainbow() {
    image[0] = loadImage("rainbow_anime0000.gif");
    image[1] = loadImage("rainbow_anime0001.gif");
     
     x = (width / 2) - (image[0].width);
     y = (height / 2) - (image[0].height / 2);
     index = 0;
  }
  
  void update() {
    if (frameCount % 10 == 0) {
      if(index < image.length - 1) {
        index++;
      } else {
        index = 0;
      }
    }
  }

  void display() {
    image(image[index], x, y);
  }
}

/**
 * Oruyanke (Takenokon)
 *
 */
class Oruyanke {
  float x;
  float y;
  int index;
  PImage[] image = new PImage[4];
  
  int imageW = 160;
  int imageH = 180;
  
  Oruyanke() {
    image[0] = loadImage("oruyanke_anime0000.gif");
    image[1] = loadImage("oruyanke_anime0001.gif");
    image[2] = loadImage("oruyanke_anime0002.gif");
    image[3] = loadImage("oruyanke_anime0003.gif");
    
    //x = (width / 2) - (image[0].width / 2);
    //y = (height / 2) - (image[0].height / 2);
    
    x = (width / 2) - (imageW / 2);
    y = (height / 2) - (imageH / 2);
    index = 0;
  }
  
  void update() {
    if (frameCount % 6 == 0) {
      if(index < image.length - 1) {
        index++;
      } else {
        index = 0;
      }
    }
  }
  
  void display() {
    image(image[index], x, y, imageW, imageH);
  }
}
