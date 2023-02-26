; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 200, align 16, !dbg !22
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = alloca i8, i64 400, align 16, !dbg !26
  %3 = bitcast i8* %2 to i32*, !dbg !27
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !25
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !28
  %tobool = icmp ne i32 %4, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  store i32* %5, i32** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %8 = bitcast i32* %7 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %9 = bitcast i32* %arraydecay to i8*, !dbg !41
  %10 = load i32*, i32** %data, align 8, !dbg !41
  %11 = bitcast i32* %10 to i8*, !dbg !41
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !41
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !41
  %13 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !42
  %14 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 noundef %14), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 200, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = alloca i8, i64 400, align 16, !dbg !78
  %3 = bitcast i8* %2 to i32*, !dbg !79
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !77
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !80
  %tobool = icmp ne i32 %4, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !86
  store i32* %5, i32** %data, align 8, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !91
  %7 = load i32*, i32** %data, align 8, !dbg !92
  %8 = bitcast i32* %7 to i8*, !dbg !92
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !92
  %9 = bitcast i32* %arraydecay to i8*, !dbg !92
  %10 = load i32*, i32** %data, align 8, !dbg !92
  %11 = bitcast i32* %10 to i8*, !dbg !92
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !92
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !92
  %13 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !93
  %14 = load i32, i32* %arrayidx, align 4, !dbg !93
  call void @printIntLine(i32 noundef %14), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 200, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 400, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !107
  %tobool = icmp ne i32 %4, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %5, i32** %data, align 8, !dbg !112
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !116
  %7 = load i32*, i32** %data, align 8, !dbg !117
  %8 = bitcast i32* %7 to i8*, !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %9 = bitcast i32* %arraydecay to i8*, !dbg !117
  %10 = load i32*, i32** %data, align 8, !dbg !117
  %11 = bitcast i32* %10 to i8*, !dbg !117
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !117
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !117
  %13 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !118
  %14 = load i32, i32* %arrayidx, align 4, !dbg !118
  call void @printIntLine(i32 noundef %14), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 11, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !3)
!21 = !DILocation(line: 24, column: 11, scope: !13)
!22 = !DILocation(line: 24, column: 34, scope: !13)
!23 = !DILocation(line: 24, column: 27, scope: !13)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 11, scope: !13)
!26 = !DILocation(line: 25, column: 35, scope: !13)
!27 = !DILocation(line: 25, column: 28, scope: !13)
!28 = !DILocation(line: 26, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!30 = !DILocation(line: 26, column: 8, scope: !13)
!31 = !DILocation(line: 30, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !14, line: 27, column: 5)
!33 = !DILocation(line: 30, column: 14, scope: !32)
!34 = !DILocation(line: 31, column: 5, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 33, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 33, column: 13, scope: !36)
!41 = !DILocation(line: 35, column: 9, scope: !36)
!42 = !DILocation(line: 36, column: 22, scope: !36)
!43 = !DILocation(line: 36, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_09_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 89, column: 5, scope: !45)
!47 = !DILocation(line: 90, column: 5, scope: !45)
!48 = !DILocation(line: 91, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !50, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DISubroutineType(types: !51)
!51 = !{!4, !4, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 103, type: !4)
!56 = !DILocation(line: 103, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 103, type: !52)
!58 = !DILocation(line: 103, column: 27, scope: !49)
!59 = !DILocation(line: 106, column: 22, scope: !49)
!60 = !DILocation(line: 106, column: 12, scope: !49)
!61 = !DILocation(line: 106, column: 5, scope: !49)
!62 = !DILocation(line: 108, column: 5, scope: !49)
!63 = !DILocation(line: 109, column: 5, scope: !49)
!64 = !DILocation(line: 110, column: 5, scope: !49)
!65 = !DILocation(line: 113, column: 5, scope: !49)
!66 = !DILocation(line: 114, column: 5, scope: !49)
!67 = !DILocation(line: 115, column: 5, scope: !49)
!68 = !DILocation(line: 117, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 47, type: !3)
!71 = !DILocation(line: 47, column: 11, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 48, type: !3)
!73 = !DILocation(line: 48, column: 11, scope: !69)
!74 = !DILocation(line: 48, column: 34, scope: !69)
!75 = !DILocation(line: 48, column: 27, scope: !69)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 49, type: !3)
!77 = !DILocation(line: 49, column: 11, scope: !69)
!78 = !DILocation(line: 49, column: 35, scope: !69)
!79 = !DILocation(line: 49, column: 28, scope: !69)
!80 = !DILocation(line: 50, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !69, file: !14, line: 50, column: 8)
!82 = !DILocation(line: 50, column: 8, scope: !69)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 51, column: 5)
!85 = !DILocation(line: 54, column: 5, scope: !84)
!86 = !DILocation(line: 58, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !14, line: 56, column: 5)
!88 = !DILocation(line: 58, column: 14, scope: !87)
!89 = !DILocalVariable(name: "source", scope: !90, file: !14, line: 61, type: !37)
!90 = distinct !DILexicalBlock(scope: !69, file: !14, line: 60, column: 5)
!91 = !DILocation(line: 61, column: 13, scope: !90)
!92 = !DILocation(line: 63, column: 9, scope: !90)
!93 = !DILocation(line: 64, column: 22, scope: !90)
!94 = !DILocation(line: 64, column: 9, scope: !90)
!95 = !DILocation(line: 66, column: 1, scope: !69)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 71, type: !3)
!98 = !DILocation(line: 71, column: 11, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !14, line: 72, type: !3)
!100 = !DILocation(line: 72, column: 11, scope: !96)
!101 = !DILocation(line: 72, column: 34, scope: !96)
!102 = !DILocation(line: 72, column: 27, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !14, line: 73, type: !3)
!104 = !DILocation(line: 73, column: 11, scope: !96)
!105 = !DILocation(line: 73, column: 35, scope: !96)
!106 = !DILocation(line: 73, column: 28, scope: !96)
!107 = !DILocation(line: 74, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !14, line: 74, column: 8)
!109 = !DILocation(line: 74, column: 8, scope: !96)
!110 = !DILocation(line: 77, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 75, column: 5)
!112 = !DILocation(line: 77, column: 14, scope: !111)
!113 = !DILocation(line: 78, column: 5, scope: !111)
!114 = !DILocalVariable(name: "source", scope: !115, file: !14, line: 80, type: !37)
!115 = distinct !DILexicalBlock(scope: !96, file: !14, line: 79, column: 5)
!116 = !DILocation(line: 80, column: 13, scope: !115)
!117 = !DILocation(line: 82, column: 9, scope: !115)
!118 = !DILocation(line: 83, column: 22, scope: !115)
!119 = !DILocation(line: 83, column: 9, scope: !115)
!120 = !DILocation(line: 85, column: 1, scope: !96)
