class JsonWriter {
  StringBuffer buffer;
  JsonWriter(this.buffer);
  bool addCommaBeforeNextKey = false;

  void startObject() {
    buffer.write('{');
  }

  void endObject() {
    buffer.write('}');
    addCommaBeforeNextKey = true;
  }

  void writeString(String name, String value) {
    if (addCommaBeforeNextKey) buffer.write(',');
    buffer.write('"$name":"$value"');
    addCommaBeforeNextKey = true;
  }

  void writeInt(String name, int value) {
    if (addCommaBeforeNextKey) buffer.write(',');
    buffer.write('"$name":$value');
    addCommaBeforeNextKey = true;
  }

  void writeKey(String name) {
    if (addCommaBeforeNextKey) buffer.write(',');
    addCommaBeforeNextKey = false;
    buffer.write('"$name":');
  }
}
