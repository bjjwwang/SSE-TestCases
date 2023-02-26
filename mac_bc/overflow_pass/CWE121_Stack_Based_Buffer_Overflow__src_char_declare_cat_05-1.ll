; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !36
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #2

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !78
  store i8* %arraydecay, i8** %data, align 8, !dbg !79
  %0 = load i32, i32* @staticFalse, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %6 = load i8*, i8** %data, align 8, !dbg !93
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !93
  %7 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %7), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %0 = load i32, i32* @staticTrue, align 4, !dbg !104
  %tobool = icmp ne i32 %0, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !107
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  br label %if.end, !dbg !111

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !114
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !115
  %6 = load i8*, i8** %data, align 8, !dbg !115
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !115
  %7 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* noundef %7), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05_bad", scope: !9, file: !9, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !9, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 10, scope: !18)
!31 = !DILocation(line: 34, column: 12, scope: !18)
!32 = !DILocation(line: 34, column: 10, scope: !18)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !9, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 8, scope: !18)
!36 = !DILocation(line: 38, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !9, line: 36, column: 5)
!38 = !DILocation(line: 39, column: 9, scope: !37)
!39 = !DILocation(line: 39, column: 21, scope: !37)
!40 = !DILocation(line: 40, column: 5, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !9, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !9, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 42, column: 14, scope: !42)
!47 = !DILocation(line: 44, column: 9, scope: !42)
!48 = !DILocation(line: 45, column: 19, scope: !42)
!49 = !DILocation(line: 45, column: 9, scope: !42)
!50 = !DILocation(line: 47, column: 1, scope: !18)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_05_good", scope: !9, file: !9, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!52 = !DILocation(line: 100, column: 5, scope: !51)
!53 = !DILocation(line: 101, column: 5, scope: !51)
!54 = !DILocation(line: 102, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 114, type: !56, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!56 = !DISubroutineType(types: !57)
!57 = !{!10, !10, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !9, line: 114, type: !10)
!60 = !DILocation(line: 114, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !9, line: 114, type: !58)
!62 = !DILocation(line: 114, column: 27, scope: !55)
!63 = !DILocation(line: 117, column: 22, scope: !55)
!64 = !DILocation(line: 117, column: 12, scope: !55)
!65 = !DILocation(line: 117, column: 5, scope: !55)
!66 = !DILocation(line: 119, column: 5, scope: !55)
!67 = !DILocation(line: 120, column: 5, scope: !55)
!68 = !DILocation(line: 121, column: 5, scope: !55)
!69 = !DILocation(line: 124, column: 5, scope: !55)
!70 = !DILocation(line: 125, column: 5, scope: !55)
!71 = !DILocation(line: 126, column: 5, scope: !55)
!72 = !DILocation(line: 128, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!74 = !DILocalVariable(name: "data", scope: !73, file: !9, line: 56, type: !23)
!75 = !DILocation(line: 56, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !9, line: 57, type: !27)
!77 = !DILocation(line: 57, column: 10, scope: !73)
!78 = !DILocation(line: 58, column: 12, scope: !73)
!79 = !DILocation(line: 58, column: 10, scope: !73)
!80 = !DILocation(line: 59, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !9, line: 59, column: 8)
!82 = !DILocation(line: 59, column: 8, scope: !73)
!83 = !DILocation(line: 62, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !9, line: 60, column: 5)
!85 = !DILocation(line: 63, column: 5, scope: !84)
!86 = !DILocation(line: 67, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !9, line: 65, column: 5)
!88 = !DILocation(line: 68, column: 9, scope: !87)
!89 = !DILocation(line: 68, column: 20, scope: !87)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !9, line: 71, type: !43)
!91 = distinct !DILexicalBlock(scope: !73, file: !9, line: 70, column: 5)
!92 = !DILocation(line: 71, column: 14, scope: !91)
!93 = !DILocation(line: 73, column: 9, scope: !91)
!94 = !DILocation(line: 74, column: 19, scope: !91)
!95 = !DILocation(line: 74, column: 9, scope: !91)
!96 = !DILocation(line: 76, column: 1, scope: !73)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!98 = !DILocalVariable(name: "data", scope: !97, file: !9, line: 81, type: !23)
!99 = !DILocation(line: 81, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !9, line: 82, type: !27)
!101 = !DILocation(line: 82, column: 10, scope: !97)
!102 = !DILocation(line: 83, column: 12, scope: !97)
!103 = !DILocation(line: 83, column: 10, scope: !97)
!104 = !DILocation(line: 84, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !9, line: 84, column: 8)
!106 = !DILocation(line: 84, column: 8, scope: !97)
!107 = !DILocation(line: 87, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !9, line: 85, column: 5)
!109 = !DILocation(line: 88, column: 9, scope: !108)
!110 = !DILocation(line: 88, column: 20, scope: !108)
!111 = !DILocation(line: 89, column: 5, scope: !108)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !9, line: 91, type: !43)
!113 = distinct !DILexicalBlock(scope: !97, file: !9, line: 90, column: 5)
!114 = !DILocation(line: 91, column: 14, scope: !113)
!115 = !DILocation(line: 93, column: 9, scope: !113)
!116 = !DILocation(line: 94, column: 19, scope: !113)
!117 = !DILocation(line: 94, column: 9, scope: !113)
!118 = !DILocation(line: 96, column: 1, scope: !97)
