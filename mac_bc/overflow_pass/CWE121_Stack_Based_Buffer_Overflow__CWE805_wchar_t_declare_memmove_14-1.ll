; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @globalFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  %2 = load i32*, i32** %data, align 8, !dbg !51
  %3 = bitcast i32* %2 to i8*, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !51
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !51
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #4, !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !52
  store i32 0, i32* %arrayidx5, align 4, !dbg !53
  %9 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* noundef %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load i32, i32* @globalFive, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  store i32* %arraydecay, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !104
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx2, align 4, !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %3 = bitcast i32* %2 to i8*, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %6 = bitcast i32* %5 to i8*, !dbg !107
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !107
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #4, !dbg !107
  %8 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !108
  store i32 0, i32* %arrayidx5, align 4, !dbg !109
  %9 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* noundef %9), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = load i32, i32* @globalFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  store i32* %arraydecay, i32** %data, align 8, !dbg !126
  %1 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx2, align 4, !dbg !136
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %3 = bitcast i32* %2 to i8*, !dbg !137
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !137
  %5 = load i32*, i32** %data, align 8, !dbg !137
  %6 = bitcast i32* %5 to i8*, !dbg !137
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !137
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #4, !dbg !137
  %8 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !138
  store i32 0, i32* %arrayidx5, align 4, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* noundef %9), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 8, scope: !11)
!38 = !DILocation(line: 32, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 29, column: 5)
!40 = !DILocation(line: 32, column: 14, scope: !39)
!41 = !DILocation(line: 33, column: 9, scope: !39)
!42 = !DILocation(line: 33, column: 17, scope: !39)
!43 = !DILocation(line: 34, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 36, type: !30)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!46 = !DILocation(line: 36, column: 17, scope: !45)
!47 = !DILocation(line: 37, column: 17, scope: !45)
!48 = !DILocation(line: 37, column: 9, scope: !45)
!49 = !DILocation(line: 38, column: 9, scope: !45)
!50 = !DILocation(line: 38, column: 23, scope: !45)
!51 = !DILocation(line: 40, column: 9, scope: !45)
!52 = !DILocation(line: 41, column: 9, scope: !45)
!53 = !DILocation(line: 41, column: 21, scope: !45)
!54 = !DILocation(line: 42, column: 20, scope: !45)
!55 = !DILocation(line: 42, column: 9, scope: !45)
!56 = !DILocation(line: 44, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_14_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!58 = !DILocation(line: 103, column: 5, scope: !57)
!59 = !DILocation(line: 104, column: 5, scope: !57)
!60 = !DILocation(line: 105, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !62, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!62 = !DISubroutineType(types: !63)
!63 = !{!22, !22, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 117, type: !22)
!68 = !DILocation(line: 117, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 117, type: !64)
!70 = !DILocation(line: 117, column: 27, scope: !61)
!71 = !DILocation(line: 120, column: 22, scope: !61)
!72 = !DILocation(line: 120, column: 12, scope: !61)
!73 = !DILocation(line: 120, column: 5, scope: !61)
!74 = !DILocation(line: 122, column: 5, scope: !61)
!75 = !DILocation(line: 123, column: 5, scope: !61)
!76 = !DILocation(line: 124, column: 5, scope: !61)
!77 = !DILocation(line: 127, column: 5, scope: !61)
!78 = !DILocation(line: 128, column: 5, scope: !61)
!79 = !DILocation(line: 129, column: 5, scope: !61)
!80 = !DILocation(line: 131, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 53, type: !17)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 54, type: !25)
!85 = !DILocation(line: 54, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 55, type: !30)
!87 = !DILocation(line: 55, column: 13, scope: !81)
!88 = !DILocation(line: 56, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !12, line: 56, column: 8)
!90 = !DILocation(line: 56, column: 18, scope: !89)
!91 = !DILocation(line: 56, column: 8, scope: !81)
!92 = !DILocation(line: 59, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !12, line: 57, column: 5)
!94 = !DILocation(line: 60, column: 5, scope: !93)
!95 = !DILocation(line: 64, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !12, line: 62, column: 5)
!97 = !DILocation(line: 64, column: 14, scope: !96)
!98 = !DILocation(line: 65, column: 9, scope: !96)
!99 = !DILocation(line: 65, column: 17, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 68, type: !30)
!101 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 5)
!102 = !DILocation(line: 68, column: 17, scope: !101)
!103 = !DILocation(line: 69, column: 17, scope: !101)
!104 = !DILocation(line: 69, column: 9, scope: !101)
!105 = !DILocation(line: 70, column: 9, scope: !101)
!106 = !DILocation(line: 70, column: 23, scope: !101)
!107 = !DILocation(line: 72, column: 9, scope: !101)
!108 = !DILocation(line: 73, column: 9, scope: !101)
!109 = !DILocation(line: 73, column: 21, scope: !101)
!110 = !DILocation(line: 74, column: 20, scope: !101)
!111 = !DILocation(line: 74, column: 9, scope: !101)
!112 = !DILocation(line: 76, column: 1, scope: !81)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 81, type: !17)
!115 = !DILocation(line: 81, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !12, line: 82, type: !25)
!117 = !DILocation(line: 82, column: 13, scope: !113)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !12, line: 83, type: !30)
!119 = !DILocation(line: 83, column: 13, scope: !113)
!120 = !DILocation(line: 84, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !12, line: 84, column: 8)
!122 = !DILocation(line: 84, column: 18, scope: !121)
!123 = !DILocation(line: 84, column: 8, scope: !113)
!124 = !DILocation(line: 87, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 85, column: 5)
!126 = !DILocation(line: 87, column: 14, scope: !125)
!127 = !DILocation(line: 88, column: 9, scope: !125)
!128 = !DILocation(line: 88, column: 17, scope: !125)
!129 = !DILocation(line: 89, column: 5, scope: !125)
!130 = !DILocalVariable(name: "source", scope: !131, file: !12, line: 91, type: !30)
!131 = distinct !DILexicalBlock(scope: !113, file: !12, line: 90, column: 5)
!132 = !DILocation(line: 91, column: 17, scope: !131)
!133 = !DILocation(line: 92, column: 17, scope: !131)
!134 = !DILocation(line: 92, column: 9, scope: !131)
!135 = !DILocation(line: 93, column: 9, scope: !131)
!136 = !DILocation(line: 93, column: 23, scope: !131)
!137 = !DILocation(line: 95, column: 9, scope: !131)
!138 = !DILocation(line: 96, column: 9, scope: !131)
!139 = !DILocation(line: 96, column: 21, scope: !131)
!140 = !DILocation(line: 97, column: 20, scope: !131)
!141 = !DILocation(line: 97, column: 9, scope: !131)
!142 = !DILocation(line: 99, column: 1, scope: !113)
