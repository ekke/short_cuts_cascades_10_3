import bb.cascades 1.3

NavigationPane {
    id: navigationPane
    
    Page {
        id: rootPage
        property int toggle: -1
        onToggleChanged: {
            if(toggle == 1){
                titleBar.title = "ON"
            } else {
                titleBar.title = "OFF"
            }
        }
        
        titleBar: TitleBar {
            id: titleBar
            title: qsTr("short cuts 10.3")
            scrollBehavior: TitleBarScrollBehavior.Sticky
        }
        
        Container {
            id: outerContainer
            layout: DockLayout {
            }
            
            ListView {
                id: listView
                topPadding: ui.du(4.0)
                
                dataModel: GroupDataModel {
                    id: dataModel
                    grouping: ItemGrouping.ByFirstChar
                    sortingKeys: ["name"]
                }
                
                listItemComponents: [
                    ListItemComponent {
                        type: "header"
                        Container {
                            id: headerRoot
                            leftPadding: ui.du(4.0)
                            topPadding: ui.du(2.0)
                            bottomPadding: ui.du(2.0)
                            Label {
                                text: ListItemData
                                textStyle.base: SystemDefaults.TextStyles.BigText
                            }
                        }
                    },
                    ListItemComponent {
                        type: "item"
                        Container {
                            id: itemRoot
                            leftPadding: ui.du(6.0)
                            Label {
                                text: ListItemData.name
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                            }
                        }
                    }
                ]
                
                onTriggered: {
                    //
                }
                
                
            } // listView
            
            
            
        } // outerContainer
        
        shortcuts: [
            SystemShortcut {
                type: SystemShortcuts.Search
                onTriggered: {
                    if(rootPage.toggle < 1){
                        rootPage.toggle = 1
                    } else {
                        rootPage.toggle = 0
                    }
                }
            }
        ]
        
        onCreationCompleted: {
            dataModel.insert({"name":"alpha"})
            dataModel.insert({"name":"centaury"})
            dataModel.insert({"name":"beta"})
            dataModel.insert({"name":"blue"})
            dataModel.insert({"name":"BlackBerry"})
            dataModel.insert({"name":"ekke"})
            dataModel.insert({"name":"ekkes-corner"})
            dataModel.insert({"name":"test"})
            dataModel.insert({"name":"zzz"})
        }
        
    } // rootPage
    
    
} // navigationPane
