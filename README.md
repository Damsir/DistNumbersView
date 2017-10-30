# DistNumbersView
可冻结行和列的表格视图，类似Numbers(Mac)和Excel(Windows)
usage:
    _numbersView.columnsToFreeze = 2;
    _numbersView.itemMaxWidth = 300;
    _numbersView.itemMinWidth = 100;
    _numbersView.rowHeight = 50;

    _numbersView.isFreezeFirstRow = YES;
    _numbersView.delegate = self;
    _numbersView.dataSource = self;
    
    [_numbersView registerNib:[UINib nibWithNibName:@"SampleCollectionCell" bundle:nil] forCellWithReuseIdentifier:SampleCollectionCellReuseIdentifier];
    //添加边界线
//    _numbersView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    _numbersView.layer.borderWidth = 0.5;
    
    [_numbersView reloadData];
