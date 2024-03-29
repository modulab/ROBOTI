
class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;
  Slider sw, sh, zoom;
  controlP5.Button[] but = new controlP5.Button[30]; 

  public ControlFrame(final PApplet _parent, int _w, int _h, String _name, Config config) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
    
    sw = cp5.addSlider("Transpune X")
       .plugTo(parent, "translateX")
       .setRange(0, 1000)
       .setValue(config.getTranslateX())
       .setPosition(50, 40)
       .setSize(200, 10);

       
    sh = cp5.addSlider("Transpune Y")
       .plugTo(parent, "translateY")
       .setRange(0, 1000)
       .setValue(config.getTranslateY())
       .setPosition(50, 55)
       .setSize(200, 10)
       ;

    zoom = cp5.addSlider("Zoom")
       .plugTo(parent, "zoom")
       .setRange(0, 10)
       .setValue(config.getZoom())
       .setPosition(50, 75)
       .setSize(200, 10)
       ;



    cp5.addSlider("Raza de ocolit")
       .plugTo(parent, "razaDeOcolit")
       .setRange(0, 100)
       .setValue(50)
       .setPosition(50, 130)
       .setSize(200, 30)
       ;

   cp5.addButton("Start")
     .setValue(0)
     .setPosition(50,500)
     .setSize(100,19)
     ;      

   cp5.addButton("Stop")
     .setValue(1)
     .setPosition(200,500)
     .setSize(100,19)
     ;      

      
     for (int i = 0; i < config.ips.length; i++) {
      println("ddd");
         but[i] = cp5.addButton(config.ips[i])
            .setValue(1)
            .setPosition(5 + i%5*80, 600+(int)(i/5)*25)
            .setSize(70, 20);
       
     }
       
       
  }


public void UpdateXYZ(int x, int y, float z) {
  sw.setValue(x);
  sh.setValue(y);
  zoom.setValue(z);
}


public void UpdateButton(int index, int c) {
  println("ccc" + index);
  but[index].setColorBackground(c);
}


public void Start(int theValue) {
  println("a button event from colorA: "+theValue);
}

public void Stop(int theValue) {
  println("a button event from colorA: "+theValue);
}



  void draw() {
    background(190);
  }
}
