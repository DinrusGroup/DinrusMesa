﻿module dlltest;
import dinrus;
pragma(lib, "dinrus.lib");

	 бул стат()
		 {
		СМ этот = new СМ();
		СМСтат стат;
		этот.дайСтат(стат);			
		скажинс(фм("размер пула = x%x, используемый размер = x%x, размер списка очистки = x%x, блоков очистки = %d, блоков страниц = %d\n",	стат.размерПула, стат.испРазмер, стат.размСпискаСвобБлоков, стат.свобБлоки, стат.блокиСтр));
			return да;
		}
		

 проц тестБитмас()
    {
	скажинс("\nПроверка BitArray.opCat");

	static bool[] ba = [1,0];
	static bool[] bb = [0,1,0];

	МассивБит a; a.иниц(ba);
	МассивБит b; b.иниц(bb);
	МассивБит к;

	к = (a ~ b);
	assert(к.длина == 5);
	assert(к[0] == 1);
	assert(к[1] == 0);
	assert(к[2] == 0);
	assert(к[3] == 1);
	assert(к[4] == 0);

	к = (a ~ да);
	assert(к.длина == 3);
	assert(к[0] == 1);
	assert(к[1] == 0);
	assert(к[2] == 1);

	к = (false ~ a);
	assert(к.длина == 3);
	assert(к[0] == 0);
	assert(к[1] == 1);
	assert(к[2] == 0);
	скажинс("БитМассив проверен");
 }

проц тестПроизводительности()
{
alias СчётчикТиков   тип_счётчик;

	тип_счётчик    счётчик = new тип_счётчик();

	счётчик.старт();
	volatile for(int и = 0; и < 10000000; ++и)
	{   }
	счётчик.стоп();

	тип_счётчик.т_интервал  us1 =   счётчик.микросекунды();
	тип_счётчик.т_интервал  ms1 =   счётчик.миллисекунды();
	тип_счётчик.т_интервал  s1  =   счётчик.секунды();

	volatile for(int и = 0; и < 10000000; ++и)
	{   }
	счётчик.стоп();

	тип_счётчик.т_интервал  us2 =   счётчик.микросекунды();
	тип_счётчик.т_интервал  ms2 =   счётчик.миллисекунды();
	тип_счётчик.т_интервал  s2  =   счётчик.секунды();

	assert(us2 >= us1);
	assert(ms2 >= ms1);
	assert(s2 >= s1);
	
скажинс("Тест производительности = ОК");
}
/*
проц тестСДЛ()
{
//СДЛ.загружай();
скажинс(форматируй("cак утверждает СДЛ, число СиДи-Драйвов равно %т",сдлЧлоКдДрайвов()));
скажинс(форматируй("cак утверждает СДЛ, РДТЦ на компютере ?... %т",cast(бул) сдлЕстьРДТСЦ()));
скажинс(форматируй("cак утверждает СДЛ, ЭмЭмЭкса ?... %т",cast(бул) сдлЕстьММЭкс()));
скажинс(форматируй("cак утверждает СДЛ, ЭмЭмЭксЭкст ?... %т",cast(бул) сдлЕстьММЭксЭкст()));
скажинс(форматируй("cак утверждает СДЛ, ТриДэНау ?...... %т",cast(бул) сдлЕсть3ДНау()));
скажинс(форматируй("cак утверждает СДЛ, ЭсЭсЭ ?... %т",cast(бул) сдлЕстьССЭ()));
скажинс(форматируй("cак утверждает СДЛ, а ССЭ2?... %т",cast(бул) сдлЕстьССЭ2()));
//СДЛ.выгружай();

пауза;
}
*/
проц тестМД5()
{
    скажи("проверка МД5: ");

    ббайт[16] дайджест;

    суммаМД5 (дайджест, "");
	скажинс(дайджестМД5вТкст(дайджест));
    assert(дайджест == cast(ббайт[])x"d41d8cd98f00b204e9800998ecf8427e");

    суммаМД5 (дайджест, "a");
	скажинс(дайджестМД5вТкст(дайджест));
    assert(дайджест == cast(ббайт[])x"0cc175b9c0f1b6a831c399e269772661");

    суммаМД5 (дайджест, "abc");
	скажинс(дайджестМД5вТкст(дайджест));
    assert(дайджест == cast(ббайт[])x"900150983cd24fb0d6963f7d28e17f72");

    суммаМД5 (дайджест, "message digest");
	скажинс(дайджестМД5вТкст(дайджест));
   assert(дайджест == cast(ббайт[])x"f96b697d7cb7938d525a2f31aaf161d0");

    суммаМД5 (дайджест, "abcdefghijklmnopqrstuvwxyz");
	скажинс(дайджестМД5вТкст(дайджест));
    assert(дайджест == cast(ббайт[])x"c3fcd3d76192e4007dfb496cca67e13b");

    суммаМД5 (дайджест, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
	скажинс(дайджестМД5вТкст(дайджест));
    assert(дайджест == cast(ббайт[])x"d174ab98d277d9f5a5611c2c9f419d9f");

    суммаМД5 (дайджест,
	"1234567890123456789012345678901234567890"
	"1234567890123456789012345678901234567890");
	скажинс(дайджестМД5вТкст(дайджест));
    assert(дайджест == cast(ббайт[])x"57edf4a22be3c955ac49da2e2107b67a");

    assert(дайджестМД5вТкст(cast(ббайт[16])x"c3fcd3d76192e4007dfb496cca67e13b")
        == "C3FCD3D76192E4007DFB496CCA67E13B");
		скажинс(дайджестМД5вТкст(дайджест));
	скажинс("МД5 дышит");
}

проц тестЗлиб()
{
    ббайт[] src = cast(ббайт[])
"the quick brown fox jumps over the lazy dog\r
the quick brown fox jumps over the lazy dog\r
";
    ббайт[] dst;
    ббайт[] результат;

	скажинс("Тест сжатия Злиб"); нс;
    скажинс(форматируй(src));
    dst = cast(ббайт[])сожмиЗлиб(cast(проц[])src);
    скажинс(форматируй(dst));
    результат = cast(ббайт[])разожмиЗлиб(cast(проц[])dst);
    скажинс(форматируй(результат));
    assert(результат == src);
	скажинс("Злиб 1 окей!");нс;
	/////////////////////////////////////////////////
    СжатиеЗлиб сз = new СжатиеЗлиб;
	скажинс("Злиб 2.. окей!");нс;
    РасжатиеЗлиб рз = new РасжатиеЗлиб;
	скажинс("Злиб 2... окей!");нс;

    проц[] входд;
    входд = "tesatdffadf ... и что-нибудь по-нашему!";

    проц[] буф = сз.сжать(входд);
	скажинс("Злиб 2..... окей!");нс;
    буф ~= сз.слей();
	скажинс("Злиб 2........ окей!");нс;
    проц[] выходд = рз.расжать(буф);
	скажинс("Злиб 3 окей!");нс;

    скажинс(форматируй("вход = '%т'", cast(ткст)входд));
    скажинс(форматируй("выход = '%т'", cast(ткст)выходд));
    assert( выходд[] == входд[] );
	
	скажинс("Злиб 2 окей!");нс;

}

проц тестКС()
{
    static ббайт[] данные = [1,2,3,4,5,6,7,8,9,10];

    бцел crc;

    скажинс(" тест цпи32 (контрольной суммы) злиб\n");
    crc = цпи32(0u, cast(проц[])данные);
    скажи(форматируй("crc = %x\n", crc));
    assert(crc == 0x2520577b);
	скажинс("цпи32 окей!"); нс;
}

проц тестАдлер()
{
    static ббайт[] данные = [1,2,3,4,5,6,7,8,9,10];

    бцел adler;

    скажинс("злиб, адлер32 тест\n");
    adler = адлер32(0u, cast(проц[])данные);
    скажинс(форматируй("адлер = %x\n", adler));
    assert(adler == 0xdc0037);
	скажинс("адлер32 окей!"); нс;
}

alias кодируйКомпонентУИР кодкомпуир;
проц тестУИР()
{
    скажинс("Тест кодирования УИР (Универсального Идентификатора Ресурса)\n");

    ткст т = "http://www.digitalmars.com/~fred/fred'т RX.html#foo";
    ткст t = "http://www.digitalmars.com/~fred/fred'т%20RX.html#foo";
    ткст r;

    r = кодируйУИР(т);
    скажи(форматируй("r = '%т'\n", r));
    assert(r == t);
    r = раскодируйУИР(t);
    скажи(форматируй("r = '%т'\n", r));
    assert(r == т);
	скажинс("жив..1");

    r = кодируйУИР( раскодируйУИР("%E3%81%82%E3%81%82") );
    assert(r == "%E3%81%82%E3%81%82");

	скажинс("жив..2");
	
    r = кодкомпуир("c++");
    скажи(форматируй("r = '%т'\n", r));
    assert(r == "c%2B%2B");
	скажинс("жив..3");

    ткст стр = симмас(10_000_000);
    стр[] = 'A';
	скажинс("Пробую,,,");
    r = кодкомпуир(стр);
	скажинс("Ну и?");
    foreach (сим к; r)
	assert(к == 'A');

	скажинс("жив..");
	
    r = раскодируйУИР("%41%42%43");
	скажинс("жив1..");
    пишифнс(r);
	скажинс("жив2..");
	скажинс("cодуир окей!"); нс;
}

проц тестУни()
{
    for (бцел и = 0; и < 0x80; и++)
    {
	if (и >= 'A' && и <= 'Z'){
	    assert(юцб_ли(и));
		скажи("проверен "); скажинс(форматируй(и));}
	else if (и >= 'a' && и <= 'z')
	    {assert(юцб_ли(и));
		скажи("проверен "); скажинс(форматируй(и));}
	else{
	    assert(!юцб_ли(и));
		скажи("проверен "); скажинс(форматируй(и));}
    }
 скажинс("юцб_ли тест прошёл!"); нс;
}

проц тестФорматируй()
{
    цел и;
    ткст т;

    скажинс("Тест формат:");
 
    т = форматируй("hello world! %т %т ", да, 57, 1_000_000_000, 'x', " foo");
    assert(т == "hello world! true 57 1000000000x foo"); скажи("Ок1.1 ");

    т = форматируй(1.67, " %A ", -1.28, плав.nan);
    /* The host C library is used to format floats.
     * C99 doesn't specify what the hex digit before the decimal point
     * is for %A.
     */
  	assert(т == "1.67 -0X1.47AE147AE147BP+0 nan"); скажи("Ок3 ");

    т = форматируй("%x %X", 0x1234AF, 0xAFAFAFAF);
    assert(т == "1234af AFAFAFAF"); скажи("Ок4 ");

    т = форматируй("%b %o", 0x1234AF, 0xAFAFAFAF);
    assert(т == "100100011010010101111 25753727657"); скажи("Ок5 ");

    т = форматируй("%d %т", 0x1234AF, 0xAFAFAFAF);
    assert(т == "1193135 2947526575"); скажи("Ок6 ");

    т = форматируй("%т", 1.2 + 3.4i);
    assert(т == "1.2+3.4i"); скажи("Ок7 ");

    т = форматируй("%x %X", 1.32, 6.78f);
    assert(т == "3ff51eb851eb851f 40D8F5C3"); скажи("Ок8 ");

    т = форматируй("%#06.*f",2,12.345);
    assert(т == "012.35"); скажи("Ок9.2 ");

    т = форматируй("%#0*.*f",6,2,12.345);
    assert(т == "012.35"); скажи("Ок1 ");

    т = форматируй("%7.4g:", 12.678);
    assert(т == "  12.68:"); скажи("Ок2 ");

    т = форматируй("%7.4g:", 12.678L);
    assert(т == "  12.68:"); скажи("Ок3 ");

    т = форматируй("%04f|%05d|%#05x|%#5x",-4.,-10,1,1);
    assert(т == "-4.000000|-0010|0x001|  0x1"); скажи("Ок4 ");

    и = -10;
    т = форматируй("%d|%3d|%03d|%1d|%01.4f",и,и,и,и,cast(дво) и);
    assert(т == "-10|-10|-10|-10|-10.0000"); скажи("Ок5 ");

    и = -5;
    т = форматируй("%d|%3d|%03d|%1d|%01.4f",и,и,и,и,cast(дво) и);
    assert(т == "-5| -5|-05|-5|-5.0000"); скажи("Ок6 ");

    и = 0;
    т = форматируй("%d|%3d|%03d|%1d|%01.4f",и,и,и,и,cast(дво) и);
    assert(т == "0|  0|000|0|0.0000"); скажи("Ок7 ");

    и = 5;
    т = форматируй("%d|%3d|%03d|%1d|%01.4f",и,и,и,и,cast(дво) и);
    assert(т == "5|  5|005|5|5.0000"); скажи("Ок8 ");

    и = 10;
    т = форматируй("%d|%3d|%03d|%1d|%01.4f",и,и,и,и,cast(дво) и);
    assert(т == "10| 10|010|10|10.0000"); скажи("Ок9 ");

    т = форматируй("%.0d", 0);
    assert(т == ""); скажи("Ок1.3 ");

    т = форматируй("%.g", .34);
    assert(т == "0.3"); скажи("Ок2 ");

    т = форматируй("%.0g", .34);
    assert(т == "0.3"); скажи("Ок3 ");

    т = форматируй("%.2g", .34);
    assert(т == "0.34"); скажи("Ок4 ");

    т = форматируй("%0.0008f", 1e-08);
    assert(т == "0.00000001"); скажи("Ок5 ");

    т = форматируй("%0.0008f", 1e-05);
    assert(т == "0.00001000"); скажи("Ок6 ");

    т = "helloworld";
    ткст r;
    r = форматируй("%.2s", т[0..5]);
    assert(r == "he"); скажи("Ок7 ");
    r = форматируй("%.20s", т[0..5]);
    assert(r == "hello"); скажи("Ок8 ");
    r = форматируй("%8s", т[0..5]);
    assert(r == "   hello"); скажи("Ок9 ");

    байт[] arrbyte = байтмас(4);
    arrbyte[0] = 100;
    arrbyte[1] = -99;
    arrbyte[3] = 0;
    r = форматируй(arrbyte);
    assert(r == "[100,-99,0,0]"); скажи("Ок1.4 ");

    ббайт[] arrббайт = ббайтмас(4);
    arrббайт[0] = 100;
    arrббайт[1] = 200;
    arrббайт[3] = 0;
    r = форматируй(arrббайт);
    assert(r == "[100,200,0,0]"); скажи("Ок2 ");

    крат[] arrshort = кратмас(4);
    arrshort[0] = 100;
    arrshort[1] = -999;
    arrshort[3] = 0;
    r = форматируй(arrshort);
    assert(r == "[100,-999,0,0]"); скажи("Ок3 ");
    r = форматируй("%т",arrshort);
    assert(r == "[100,-999,0,0]"); скажи("Ок4 ");

    бкрат[] arrushort = бкратмас(4);
    arrushort[0] = 100;
    arrushort[1] = 20_000;
    arrushort[3] = 0;
    r = форматируй(arrushort);
    assert(r == "[100,20000,0,0]"); скажи("Ок5 ");

    цел[] arrint = целмас(4);
    arrint[0] = 100;
    arrint[1] = -999;
    arrint[3] = 0;
    r = форматируй(arrint);
    assert(r == "[100,-999,0,0]"); скажи("Ок6 ");
    r = форматируй("%т",arrint);
    assert(r == "[100,-999,0,0]"); скажи("Ок7 ");

    дол[] arrlong = долмас(4);
    arrlong[0] = 100;
    arrlong[1] = -999;
    arrlong[3] = 0;
    r = форматируй(arrlong);
    assert(r == "[100,-999,0,0]"); скажи("Ок8 ");
    r = форматируй("%т",arrlong);
    assert(r == "[100,-999,0,0]"); скажи("Ок9 ");

    бдол[] arrulong = бдолмас(4);
    arrulong[0] = 100;
    arrulong[1] = 999;
    arrulong[3] = 0;
    r = форматируй(arrulong);
    assert(r == "[100,999,0,0]"); скажи("Ок1.5 ");

   /* ткст[] arr2 = ткстмас(4);
    arr2[0] = "hello";
    arr2[1] = "world";
    arr2[3] = "foo";
	//скажинс(arr2);
    r = форматируй("%т", arr2);//!	
    assert(r == "[hello,world,,foo]"); скажи("Ок2 ");*/ //Это единственная проблема с массивами!!!!!!!!!!!!!

    r = форматируй("%.8d", 7);
    assert(r == "00000007"); скажи("Ок3 ");
    r = форматируй("%.8x", 10);
    assert(r == "0000000a"); скажи("Ок4 ");

    r = форматируй("%-3d", 7);
    assert(r == "7  "); скажи("Ок5 ");

    r = форматируй("%*d", -3, 7);
    assert(r == "7  "); скажи("Ок6 ");

    r = форматируй("%.*d", -3, 7);
    assert(r == "7"); скажи("Ок7 ");

    typedef цел myint;
    myint m = -7;
    r = форматируй(cast(цел) m);
    assert(r == "-7"); скажи("Ок8 ");

    r = форматируй("abc"c);
    assert(r == "abc"); скажи("Ок9 ");
    r = форматируй("def"w);
    assert(r == "def"); скажи("Ок1.6 ");
    r = форматируй("ghi"d);
    assert(r == "ghi"); скажи("Ок2 ");

    ук p = cast(ук)0xDEADBEEF;
    r = форматируй(p);
    assert(r == "DEADBEEF"); скажи("Ок3 ");

    r = форматируй("%#x", 0xabcd);
    assert(r == "0xabcd"); скажи("Ок4 ");
    r = форматируй("%#X", 0xABCD);
    assert(r == "0XABCD"); скажи("Ок5 ");

    r = форматируй("%#o", 012345);
    assert(r == "012345"); скажи("Ок6 ");
    r = форматируй("%o", 9);
    assert(r == "11"); скажи("Ок7 ");

    r = форматируй("%+d", 123);
    assert(r == "+123"); скажи("Ок8 ");
    r = форматируй("%+d", -123);
    assert(r == "-123"); скажи("Ок9 ");
    r = форматируй("% d", 123);
    assert(r == " 123"); скажи("Ок1.7 ");
    r = форматируй("% d", -123);
    assert(r == "-123"); скажи("Ок2 ");

    r = форматируй("%%");
    assert(r == "%"); скажи("Ок3 ");

    r = форматируй("%d", да);
    assert(r == "1"); скажи("Ок4 ");
    r = форматируй("%d", false);
    assert(r == "0"); скажи("Ок5 ");

    r = форматируй("%d", 'a');
    assert(r == "97"); скажи("Ок6 ");
    шим wc = 'a';
    r = форматируй("%d", wc);
    assert(r == "97"); скажи("Ок7 ");
    дим dc = 'a';
    r = форматируй("%d", dc);
    assert(r == "97"); скажи("Ок8 ");

    байт b = байт.max;
    r = форматируй("%x", b);
    assert(r == "7f"); скажи("Ок9 ");
    r = форматируй("%x", ++b);
    assert(r == "80"); скажи("Ок1.8 ");
    r = форматируй("%x", ++b);
    assert(r == "81"); скажи("Ок2 ");

    крат sh = крат.max;
    r = форматируй("%x", sh);
    assert(r == "7fff"); скажи("Ок3 ");
    r = форматируй("%x", ++sh);
    assert(r == "8000"); скажи("Ок4 ");
    r = форматируй("%x", ++sh);
    assert(r == "8001"); скажи("Ок5 ");

    и = цел.max;
    r = форматируй("%x", и);
    assert(r == "7fffffff"); скажи("Ок6 ");
    r = форматируй("%x", ++и);
    assert(r == "80000000"); скажи("Ок7 ");
    r = форматируй("%x", ++и);
    assert(r == "80000001"); скажи("Ок8 ");

    r = форматируй("%x", 10);
    assert(r == "a"); скажи("Ок9 ");
    r = форматируй("%X", 10);
    assert(r == "A"); скажи("Ок1.0 ");
    r = форматируй("%x", 15);
    assert(r == "f"); скажи("Ок2 ");
    r = форматируй("%X", 15);
    assert(r == "F"); скажи("Ок3 ");

    Object к = пусто;
    r = форматируй(к);
    assert(r == "null"); скажи("Ок4-объект ");

   /* enum TestEnum
    {
	    Value1, Value2
    }
    r = форматируй("%т", TestEnum.Value2);
    assert(r == "1"); скажи("Ок5 ");*/

   /* сим[5][цел] aa = ([3:"hello", 4:"betty"]);
    r = форматируй("%т", aa.values);
    assert(r == "[[h,e,l,l,o],[b,e,t,t,y]]"); скажи("Ок6 ");
    r = форматируй("%т", aa);
    assert(r == "[3:[h,e,l,l,o],4:[b,e,t,t,y]]"); скажи("Ок7 ");*/

    static const дим[] ds = ['a','b'];
    for (цел j = 0; j < ds.length; ++j)
    {
	r = форматируй(" %d", ds[j]);
	if (j == 0)
	    {assert(r == " 97"); скажи("Ок8 ");  }
	else
	    {assert(r == " 98"); скажи("Ок9 ");}
    }

  /*  r = форматируй(">%14d<, ", 15, [1,2,3]);
    assert(r == ">            15<, [1,2,3]"); скажи("Ок1... ");*/

    assert(форматируй("%8s", "bar") == "     bar"); скажи("Ок2 ");
    assert(форматируй("%8s", "b\u00e9ll\u00f4") == "   b\u00e9ll\u00f4"); скажи("Ок3 -Финиш! ");
}

проц тестПротокол()
{
	Протокол proto = new Протокол;
	assert(proto.дайПротоколПоТипу(ППротокол.ПУТ));
	скажинс(форматируй("О протоколе TCP(ПУТ):\n\tИмя: %т\n", proto.имя));
	foreach(string т; proto.алиасы)
	{
		скажинс(форматируй("\tАлиасы: %т\n", т));
	}
}

проц тестСлужба()
{
	Служба serv = new Служба;
	if(serv.дайСлужбуПоИмени("epmap", "tcp"))
	{
		скажинс(форматируй("О службе epmap:\n\tСлужба: %т\n\tПорт: %d\n\tПротокол: %т\n",
			serv.имя, serv.порт, serv.имяПротокола));
		foreach(string т; serv.алиасы)
		{
			скажинс(форматируй("\tАлиас: %т\n", т));
		}
	}
	else
	{
		скажинс("Для epmap службы не обнаружено.\n");
	}
}

проц тестИнтернетХост()
{
	ИнтернетХост ih = new ИнтернетХост;
	assert(ih.дайХостПоИмени("localhost"));
	скажинс(форматируй("списокАдр.длина = %d\n", ih.списокАдр.length));
	assert(ih.списокАдр.length);
	ИнтернетАдрес ia = new ИнтернетАдрес(ih.списокАдр[0], ИнтернетАдрес.ПОРТ_ЛЮБОЙ);
	скажинс(форматируй("ИП адрес = %т\nимя = %т\n", ia.вАдрТкст(), ih.имя));
	foreach(цел и, ткст т; ih.алиасы)
	{
		скажинс(форматируй("алиасы[%d] = %*т\n", и, т));
	}

	эхо("---\n");

	assert(ih.дайХостПоАдр(ih.списокАдр[0]));
	скажинс(форматируй("имя = %т\n", ih.имя));
	foreach(цел и, ткст т; ih.алиасы)
	{
		скажинс(форматируй("алиасы[%d] = %т\n", и, т));
	}
}

проц дир()
  {
     bool обрвыз(ПапЗап* de)
     {
       if (de.папка_ли)
         списпап(de.имя, &обрвыз);
       else
        скажинс(de.имя);
       return true;
     }
 
     списпап(".", &обрвыз);
  }

проц тестИА()
{
	ИнтернетАдрес ia = new ИнтернетАдрес("63.105.9.61", 80);
	assert(ia.вТкст() == "63.105.9.61:80");
	скажинс("Тест ИнтернетАдрес - ОК");
}

бул откройДиск()
{
ткст[] варианты = ["d:", "e:", "g:","h:"];
foreach(вариант; варианты)
 try{
	if(_откройДисковод(вариант)) return да;
	}
	catch(Исключение и){и.выведи();}
	return нет;
}

бул закройДиск()
{
ткст[] варианты = ["d:", "e:", "g:","h:"];
foreach(вариант; варианты)
 try{
	if(_закройДисковод(вариант)) return да;
	}
	catch(Исключение и){и.выведи();}
	return нет;
}
	

проц Qmain()
{
скажинс("Это выполняется файл "~__FILE__);
пишиф("Hie, Everybody, there... ");пишифнс("asasssssssssssssssssllllllllllllllllllm,mmnm"); 
//скажинс(фм("НА ДАННОМ КОМПЕ ОБНАРУЖЕНА СЛЕДУЮЩАЯ СРЕДА ВЫПОЛНЕНИЯ:\n"~дайсреду("PATH")));
//скажинс(читайстр());
//пауза;
скажинс(_о_ЦПУ);
тестПроизводительности();
тестМД5();
//тестКС();
//тестАдлер();
//тестУни();
//тестФорматируй();
//тестПротокол();
//тестСлужба();
//тестИнтернетХост();
//тестИА();
дир();
//тестУИР();
//тестЗлиб();
пауза();
откройДиск();//овод("g:");
закройДиск();//овод("g:");
ук файлУк = СоздайФайл(вЮ16(".\\rrrrr.txt"c), ППраваДоступа.ГенернаяЗапись, ПСовмИспФайла.Запись,  пусто, ПРежСоздФайла.ОткрытьВсегда, ПФайл.Нормальный, пусто);
НайдиЗакрой(файлУк);
удалиФайл(".\\rrrrr.txt"c);
скажинс("Версия Windows: "); скажинс(вТкст(ДайВерсию()));
скажи(cast(ткст) читайФайл("test.d"));
//throw new ВнеПамИскл;//ошибкаНехваткиПамяти();
тестБитмас();

инфо("ЛЯ-ЛЯ_ЛЯ");
//двых.пишиСтр("Seems, we cannot get good Russian here, when testing \"dvyh\": Проверяем двых. Если текст есть, значит, работает");
//дош.пишиСтр("Проверяем дош. Если текст есть, значит, работает");
//ошибка ("АТАС!
// Просто так, пугаю... Это не по настоящему)))",__FILE__, __LINE__);

}

export extern (C) void testMeBetter()
{
скажинс("Я живая");
стат();
пауза;
Qmain();

}
