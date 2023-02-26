; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data, align 8, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx2, align 1, !dbg !50
  %2 = load i8*, i8** %data, align 8, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !51
  %call = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay3, i64 noundef 99, i64 noundef %4) #5, !dbg !51
  %5 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !52
  store i8 0, i8* %arrayidx4, align 1, !dbg !53
  %6 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* noundef %6), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_good() #0 !dbg !57 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i8* %arraydecay, i8** %data, align 8, !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !103
  %call = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay3, i64 noundef 99, i64 noundef %4) #5, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !104
  store i8 0, i8* %arrayidx4, align 1, !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %6), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load i32, i32* @staticTrue, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay, i8** %data, align 8, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx2, align 1, !dbg !130
  %2 = load i8*, i8** %data, align 8, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !131
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !131
  %call = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay3, i64 noundef 99, i64 noundef %4) #5, !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !132
  store i8 0, i8* %arrayidx4, align 1, !dbg !133
  %6 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* noundef %6), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_bad", scope: !9, file: !9, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 10, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 10, scope: !18)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !9, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !18)
!39 = !DILocation(line: 39, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !9, line: 36, column: 5)
!41 = !DILocation(line: 39, column: 14, scope: !40)
!42 = !DILocation(line: 40, column: 9, scope: !40)
!43 = !DILocation(line: 40, column: 17, scope: !40)
!44 = !DILocation(line: 41, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !9, line: 43, type: !32)
!46 = distinct !DILexicalBlock(scope: !18, file: !9, line: 42, column: 5)
!47 = !DILocation(line: 43, column: 14, scope: !46)
!48 = !DILocation(line: 44, column: 9, scope: !46)
!49 = !DILocation(line: 45, column: 9, scope: !46)
!50 = !DILocation(line: 45, column: 23, scope: !46)
!51 = !DILocation(line: 47, column: 9, scope: !46)
!52 = !DILocation(line: 48, column: 9, scope: !46)
!53 = !DILocation(line: 48, column: 21, scope: !46)
!54 = !DILocation(line: 49, column: 19, scope: !46)
!55 = !DILocation(line: 49, column: 9, scope: !46)
!56 = !DILocation(line: 51, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_good", scope: !9, file: !9, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!58 = !DILocation(line: 110, column: 5, scope: !57)
!59 = !DILocation(line: 111, column: 5, scope: !57)
!60 = !DILocation(line: 112, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 124, type: !62, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!62 = !DISubroutineType(types: !63)
!63 = !{!10, !10, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !9, line: 124, type: !10)
!66 = !DILocation(line: 124, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !9, line: 124, type: !64)
!68 = !DILocation(line: 124, column: 27, scope: !61)
!69 = !DILocation(line: 127, column: 22, scope: !61)
!70 = !DILocation(line: 127, column: 12, scope: !61)
!71 = !DILocation(line: 127, column: 5, scope: !61)
!72 = !DILocation(line: 129, column: 5, scope: !61)
!73 = !DILocation(line: 130, column: 5, scope: !61)
!74 = !DILocation(line: 131, column: 5, scope: !61)
!75 = !DILocation(line: 134, column: 5, scope: !61)
!76 = !DILocation(line: 135, column: 5, scope: !61)
!77 = !DILocation(line: 136, column: 5, scope: !61)
!78 = !DILocation(line: 138, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!80 = !DILocalVariable(name: "data", scope: !79, file: !9, line: 60, type: !23)
!81 = !DILocation(line: 60, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !9, line: 61, type: !27)
!83 = !DILocation(line: 61, column: 10, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !9, line: 62, type: !32)
!85 = !DILocation(line: 62, column: 10, scope: !79)
!86 = !DILocation(line: 63, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !9, line: 63, column: 8)
!88 = !DILocation(line: 63, column: 8, scope: !79)
!89 = !DILocation(line: 66, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !9, line: 64, column: 5)
!91 = !DILocation(line: 67, column: 5, scope: !90)
!92 = !DILocation(line: 71, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !9, line: 69, column: 5)
!94 = !DILocation(line: 71, column: 14, scope: !93)
!95 = !DILocation(line: 72, column: 9, scope: !93)
!96 = !DILocation(line: 72, column: 17, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !9, line: 75, type: !32)
!98 = distinct !DILexicalBlock(scope: !79, file: !9, line: 74, column: 5)
!99 = !DILocation(line: 75, column: 14, scope: !98)
!100 = !DILocation(line: 76, column: 9, scope: !98)
!101 = !DILocation(line: 77, column: 9, scope: !98)
!102 = !DILocation(line: 77, column: 23, scope: !98)
!103 = !DILocation(line: 79, column: 9, scope: !98)
!104 = !DILocation(line: 80, column: 9, scope: !98)
!105 = !DILocation(line: 80, column: 21, scope: !98)
!106 = !DILocation(line: 81, column: 19, scope: !98)
!107 = !DILocation(line: 81, column: 9, scope: !98)
!108 = !DILocation(line: 83, column: 1, scope: !79)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!110 = !DILocalVariable(name: "data", scope: !109, file: !9, line: 88, type: !23)
!111 = !DILocation(line: 88, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !9, line: 89, type: !27)
!113 = !DILocation(line: 89, column: 10, scope: !109)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !9, line: 90, type: !32)
!115 = !DILocation(line: 90, column: 10, scope: !109)
!116 = !DILocation(line: 91, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !9, line: 91, column: 8)
!118 = !DILocation(line: 91, column: 8, scope: !109)
!119 = !DILocation(line: 94, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !9, line: 92, column: 5)
!121 = !DILocation(line: 94, column: 14, scope: !120)
!122 = !DILocation(line: 95, column: 9, scope: !120)
!123 = !DILocation(line: 95, column: 17, scope: !120)
!124 = !DILocation(line: 96, column: 5, scope: !120)
!125 = !DILocalVariable(name: "source", scope: !126, file: !9, line: 98, type: !32)
!126 = distinct !DILexicalBlock(scope: !109, file: !9, line: 97, column: 5)
!127 = !DILocation(line: 98, column: 14, scope: !126)
!128 = !DILocation(line: 99, column: 9, scope: !126)
!129 = !DILocation(line: 100, column: 9, scope: !126)
!130 = !DILocation(line: 100, column: 23, scope: !126)
!131 = !DILocation(line: 102, column: 9, scope: !126)
!132 = !DILocation(line: 103, column: 9, scope: !126)
!133 = !DILocation(line: 103, column: 21, scope: !126)
!134 = !DILocation(line: 104, column: 19, scope: !126)
!135 = !DILocation(line: 104, column: 9, scope: !126)
!136 = !DILocation(line: 106, column: 1, scope: !109)
