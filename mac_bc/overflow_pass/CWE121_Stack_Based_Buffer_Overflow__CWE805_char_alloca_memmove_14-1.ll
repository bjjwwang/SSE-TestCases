; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i32, i32* @globalFive, align 4, !dbg !26
  %cmp = icmp eq i32 %2, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %3, i8** %data, align 8, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx1, align 1, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !45
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %7) #5, !dbg !45
  %8 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !46
  store i8 0, i8* %arrayidx3, align 1, !dbg !47
  %9 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14_good() #0 !dbg !51 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 50, align 16, !dbg !79
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !81
  %2 = load i32, i32* @globalFive, align 4, !dbg !83
  %cmp = icmp ne i32 %2, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  store i8* %3, i8** %data, align 8, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx1, align 1, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  %6 = load i8*, i8** %data, align 8, !dbg !101
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !101
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %7) #5, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !102
  store i8 0, i8* %arrayidx3, align 1, !dbg !103
  %9 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* noundef %9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 50, align 16, !dbg !112
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = alloca i8, i64 100, align 16, !dbg !115
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !114
  %2 = load i32, i32* @globalFive, align 4, !dbg !116
  %cmp = icmp eq i32 %2, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  store i8* %3, i8** %data, align 8, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx1, align 1, !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !132
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !132
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %7) #5, !dbg !132
  %8 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !133
  store i8 0, i8* %arrayidx3, align 1, !dbg !134
  %9 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* noundef %9), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 8, scope: !13)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 14, scope: !31)
!33 = !DILocation(line: 33, column: 9, scope: !31)
!34 = !DILocation(line: 33, column: 17, scope: !31)
!35 = !DILocation(line: 34, column: 5, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 36, column: 14, scope: !37)
!42 = !DILocation(line: 37, column: 9, scope: !37)
!43 = !DILocation(line: 38, column: 9, scope: !37)
!44 = !DILocation(line: 38, column: 23, scope: !37)
!45 = !DILocation(line: 40, column: 9, scope: !37)
!46 = !DILocation(line: 41, column: 9, scope: !37)
!47 = !DILocation(line: 41, column: 21, scope: !37)
!48 = !DILocation(line: 42, column: 19, scope: !37)
!49 = !DILocation(line: 42, column: 9, scope: !37)
!50 = !DILocation(line: 44, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_14_good", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!52 = !DILocation(line: 103, column: 5, scope: !51)
!53 = !DILocation(line: 104, column: 5, scope: !51)
!54 = !DILocation(line: 105, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 117, type: !56, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 117, type: !58)
!61 = !DILocation(line: 117, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 117, type: !59)
!63 = !DILocation(line: 117, column: 27, scope: !55)
!64 = !DILocation(line: 120, column: 22, scope: !55)
!65 = !DILocation(line: 120, column: 12, scope: !55)
!66 = !DILocation(line: 120, column: 5, scope: !55)
!67 = !DILocation(line: 122, column: 5, scope: !55)
!68 = !DILocation(line: 123, column: 5, scope: !55)
!69 = !DILocation(line: 124, column: 5, scope: !55)
!70 = !DILocation(line: 127, column: 5, scope: !55)
!71 = !DILocation(line: 128, column: 5, scope: !55)
!72 = !DILocation(line: 129, column: 5, scope: !55)
!73 = !DILocation(line: 131, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 53, type: !3)
!76 = !DILocation(line: 53, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !14, line: 54, type: !3)
!78 = !DILocation(line: 54, column: 12, scope: !74)
!79 = !DILocation(line: 54, column: 36, scope: !74)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !14, line: 55, type: !3)
!81 = !DILocation(line: 55, column: 12, scope: !74)
!82 = !DILocation(line: 55, column: 37, scope: !74)
!83 = !DILocation(line: 56, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !14, line: 56, column: 8)
!85 = !DILocation(line: 56, column: 18, scope: !84)
!86 = !DILocation(line: 56, column: 8, scope: !74)
!87 = !DILocation(line: 59, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !14, line: 57, column: 5)
!89 = !DILocation(line: 60, column: 5, scope: !88)
!90 = !DILocation(line: 64, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !14, line: 62, column: 5)
!92 = !DILocation(line: 64, column: 14, scope: !91)
!93 = !DILocation(line: 65, column: 9, scope: !91)
!94 = !DILocation(line: 65, column: 17, scope: !91)
!95 = !DILocalVariable(name: "source", scope: !96, file: !14, line: 68, type: !38)
!96 = distinct !DILexicalBlock(scope: !74, file: !14, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 14, scope: !96)
!98 = !DILocation(line: 69, column: 9, scope: !96)
!99 = !DILocation(line: 70, column: 9, scope: !96)
!100 = !DILocation(line: 70, column: 23, scope: !96)
!101 = !DILocation(line: 72, column: 9, scope: !96)
!102 = !DILocation(line: 73, column: 9, scope: !96)
!103 = !DILocation(line: 73, column: 21, scope: !96)
!104 = !DILocation(line: 74, column: 19, scope: !96)
!105 = !DILocation(line: 74, column: 9, scope: !96)
!106 = !DILocation(line: 76, column: 1, scope: !74)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 81, type: !3)
!109 = !DILocation(line: 81, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !14, line: 82, type: !3)
!111 = !DILocation(line: 82, column: 12, scope: !107)
!112 = !DILocation(line: 82, column: 36, scope: !107)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !14, line: 83, type: !3)
!114 = !DILocation(line: 83, column: 12, scope: !107)
!115 = !DILocation(line: 83, column: 37, scope: !107)
!116 = !DILocation(line: 84, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !14, line: 84, column: 8)
!118 = !DILocation(line: 84, column: 18, scope: !117)
!119 = !DILocation(line: 84, column: 8, scope: !107)
!120 = !DILocation(line: 87, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !14, line: 85, column: 5)
!122 = !DILocation(line: 87, column: 14, scope: !121)
!123 = !DILocation(line: 88, column: 9, scope: !121)
!124 = !DILocation(line: 88, column: 17, scope: !121)
!125 = !DILocation(line: 89, column: 5, scope: !121)
!126 = !DILocalVariable(name: "source", scope: !127, file: !14, line: 91, type: !38)
!127 = distinct !DILexicalBlock(scope: !107, file: !14, line: 90, column: 5)
!128 = !DILocation(line: 91, column: 14, scope: !127)
!129 = !DILocation(line: 92, column: 9, scope: !127)
!130 = !DILocation(line: 93, column: 9, scope: !127)
!131 = !DILocation(line: 93, column: 23, scope: !127)
!132 = !DILocation(line: 95, column: 9, scope: !127)
!133 = !DILocation(line: 96, column: 9, scope: !127)
!134 = !DILocation(line: 96, column: 21, scope: !127)
!135 = !DILocation(line: 97, column: 19, scope: !127)
!136 = !DILocation(line: 97, column: 9, scope: !127)
!137 = !DILocation(line: 99, column: 1, scope: !107)
