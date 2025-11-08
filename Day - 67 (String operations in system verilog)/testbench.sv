module string_opertions;
  int f,m;
  byte out;
  string str;
  string str1;
  string str2,str3;
  initial begin
    str = "SEMICONDUCTOR";
    $display("No. of characters : %0d",str.len());
    str.putc(1,"O");
    $display("String : %0s",str);
    out = str.getc(1);
    $display("String get of 1st index : %0s",out);
    str1 = str.tolower();
    $display("String1 : %0s",str1);
    f = str.compare(str1);
    $display("String compare : %0d",f);
    m = str.icompare(str1);
    $display("String icompare : %0d",m);
    $display("Substring of the main string : %0s",str.substr(2,4));
    $display("---------- String Reversing ----------");
    str2 = "Industry";
    str3 = str2;
    $display("String : %0s",str2);
    for(int i = 0;i<str.len();i++) begin
      str3.putc(i,str2[str2.len()-1-i]);
    end
    $display("Reversed string : %0s",str3);
  end
endmodule
