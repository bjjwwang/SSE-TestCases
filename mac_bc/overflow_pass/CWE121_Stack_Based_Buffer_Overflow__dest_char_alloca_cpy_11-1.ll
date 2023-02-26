; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11_bad() #0 !dbg !13 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx1, align 1, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !44
  %call3 = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef %6) #5, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %7), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 50, align 16, !dbg !76
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = alloca i8, i64 100, align 16, !dbg !79
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !78
  %call = call i32 (...) @globalReturnsFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !86
  store i8* %2, i8** %data, align 8, !dbg !88
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx1, align 1, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  %5 = load i8*, i8** %data, align 8, !dbg !97
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !97
  %call3 = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef %6) #5, !dbg !97
  %7 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* noundef %7), !dbg !99
  ret void, !dbg !100
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 50, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 100, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %call = call i32 (...) @globalReturnsTrue(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %2, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx1, align 1, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !125
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !125
  %call3 = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef %6) #5, !dbg !125
  %7 = load i8*, i8** %data, align 8, !dbg !126
  call void @printLine(i8* noundef %7), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!28 = !DILocation(line: 28, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 29, column: 5)
!31 = !DILocation(line: 32, column: 14, scope: !30)
!32 = !DILocation(line: 33, column: 9, scope: !30)
!33 = !DILocation(line: 33, column: 17, scope: !30)
!34 = !DILocation(line: 34, column: 5, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 14, scope: !36)
!41 = !DILocation(line: 37, column: 9, scope: !36)
!42 = !DILocation(line: 38, column: 9, scope: !36)
!43 = !DILocation(line: 38, column: 23, scope: !36)
!44 = !DILocation(line: 40, column: 9, scope: !36)
!45 = !DILocation(line: 41, column: 19, scope: !36)
!46 = !DILocation(line: 41, column: 9, scope: !36)
!47 = !DILocation(line: 43, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_11_good", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!49 = !DILocation(line: 100, column: 5, scope: !48)
!50 = !DILocation(line: 101, column: 5, scope: !48)
!51 = !DILocation(line: 102, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 114, type: !53, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 114, type: !55)
!58 = !DILocation(line: 114, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 114, type: !56)
!60 = !DILocation(line: 114, column: 27, scope: !52)
!61 = !DILocation(line: 117, column: 22, scope: !52)
!62 = !DILocation(line: 117, column: 12, scope: !52)
!63 = !DILocation(line: 117, column: 5, scope: !52)
!64 = !DILocation(line: 119, column: 5, scope: !52)
!65 = !DILocation(line: 120, column: 5, scope: !52)
!66 = !DILocation(line: 121, column: 5, scope: !52)
!67 = !DILocation(line: 124, column: 5, scope: !52)
!68 = !DILocation(line: 125, column: 5, scope: !52)
!69 = !DILocation(line: 126, column: 5, scope: !52)
!70 = !DILocation(line: 128, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 52, type: !3)
!73 = !DILocation(line: 52, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !14, line: 53, type: !3)
!75 = !DILocation(line: 53, column: 12, scope: !71)
!76 = !DILocation(line: 53, column: 36, scope: !71)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !14, line: 54, type: !3)
!78 = !DILocation(line: 54, column: 12, scope: !71)
!79 = !DILocation(line: 54, column: 37, scope: !71)
!80 = !DILocation(line: 55, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !14, line: 55, column: 8)
!82 = !DILocation(line: 55, column: 8, scope: !71)
!83 = !DILocation(line: 58, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 56, column: 5)
!85 = !DILocation(line: 59, column: 5, scope: !84)
!86 = !DILocation(line: 63, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !14, line: 61, column: 5)
!88 = !DILocation(line: 63, column: 14, scope: !87)
!89 = !DILocation(line: 64, column: 9, scope: !87)
!90 = !DILocation(line: 64, column: 17, scope: !87)
!91 = !DILocalVariable(name: "source", scope: !92, file: !14, line: 67, type: !37)
!92 = distinct !DILexicalBlock(scope: !71, file: !14, line: 66, column: 5)
!93 = !DILocation(line: 67, column: 14, scope: !92)
!94 = !DILocation(line: 68, column: 9, scope: !92)
!95 = !DILocation(line: 69, column: 9, scope: !92)
!96 = !DILocation(line: 69, column: 23, scope: !92)
!97 = !DILocation(line: 71, column: 9, scope: !92)
!98 = !DILocation(line: 72, column: 19, scope: !92)
!99 = !DILocation(line: 72, column: 9, scope: !92)
!100 = !DILocation(line: 74, column: 1, scope: !71)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 79, type: !3)
!103 = !DILocation(line: 79, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 80, type: !3)
!105 = !DILocation(line: 80, column: 12, scope: !101)
!106 = !DILocation(line: 80, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 81, type: !3)
!108 = !DILocation(line: 81, column: 12, scope: !101)
!109 = !DILocation(line: 81, column: 37, scope: !101)
!110 = !DILocation(line: 82, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !14, line: 82, column: 8)
!112 = !DILocation(line: 82, column: 8, scope: !101)
!113 = !DILocation(line: 85, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 83, column: 5)
!115 = !DILocation(line: 85, column: 14, scope: !114)
!116 = !DILocation(line: 86, column: 9, scope: !114)
!117 = !DILocation(line: 86, column: 17, scope: !114)
!118 = !DILocation(line: 87, column: 5, scope: !114)
!119 = !DILocalVariable(name: "source", scope: !120, file: !14, line: 89, type: !37)
!120 = distinct !DILexicalBlock(scope: !101, file: !14, line: 88, column: 5)
!121 = !DILocation(line: 89, column: 14, scope: !120)
!122 = !DILocation(line: 90, column: 9, scope: !120)
!123 = !DILocation(line: 91, column: 9, scope: !120)
!124 = !DILocation(line: 91, column: 23, scope: !120)
!125 = !DILocation(line: 93, column: 9, scope: !120)
!126 = !DILocation(line: 94, column: 19, scope: !120)
!127 = !DILocation(line: 94, column: 9, scope: !120)
!128 = !DILocation(line: 96, column: 1, scope: !101)
