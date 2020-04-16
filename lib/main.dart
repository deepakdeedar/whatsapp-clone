import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {

    _tabController= new TabController(length: 4, vsync: this);
    _scrollController=new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context,bool innerBoxScroll){
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  SizedBox(width: 15.0,),
                  Icon(Icons.more_vert),
                  SizedBox(width: 20.0,)
                ],
                centerTitle: false,
                pinned: true,
                floating: true,
                backgroundColor: Color(0xFF075e54),
                title: Text('Whatsapp'),
                bottom: TabBar(
                  indicatorWeight: 5.0,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Icon(Icons.photo_camera),
                    ),
                    Tab(
                      text: 'CHATS',
                    ),
                    Tab(
                      text: 'STATUS',
                    ),
                    Tab(
                      text: 'CALLS',
                    )
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Text('Camera'),
              Chats(),
              status(),
              Text('Calls')
            ],
          ),
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {

    List<String> name =[
      'Rahul',
      'Sham',
      'Kunal'
    ];

    List<String> text=[
      'Hello',
      'kya chal raha h?',
      'Good Morning'
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green,
        child: Center(
          child: Icon(Icons.message),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:NetworkImage("https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
                  ),
                  title: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(text[index]),
                  trailing: Column(
                    children: <Widget>[
                      Text('10.00 am',style: TextStyle(color: Colors.grey,fontSize: 12),),
                      SizedBox(height: 20,),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          color: Colors.green,
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          child: Text('2',style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
class status extends StatefulWidget {
  @override
  _statusState createState() => _statusState();
}

class _statusState extends State<status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green,
        child: Center(child: Icon(Icons.photo_camera),),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage:NetworkImage("https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      color: Colors.green,
                      child: Icon(Icons.add,size: 20,),
                    ),
                  ),
                ),
              ),
              title: Text('My Status'),
              subtitle: Text('Tap to add status update'),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 30,
              color: Colors.grey[200],
              child: Text('Viewed updates',style: TextStyle(color: Colors.grey[800],fontSize: 16),),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                  color: Colors.green,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:NetworkImage("https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
                  ),
                ),
              ),
              title: Text('Rahul'),
              subtitle: Text('8 minutes ago'),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                  color: Colors.green,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:NetworkImage("https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
                  ),
                ),
              ),
              title: Text('Kunal'),
              subtitle: Text('Today, 5:46 PM'),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
                child: Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:NetworkImage("https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
                  ),
                ),
              ),
              title: Text('Sham'),
              subtitle: Text('Yesterday, 11:54 PM'),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                  color: Colors.green,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:NetworkImage("https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
                  ),
                ),
              ),
              title: Text('Ram'),
              subtitle: Text('Today, 8:25 AM'),
            )
          ],
        ),
      ),
    );
  }
}

