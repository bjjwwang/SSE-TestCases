; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !32
  %cmp = icmp eq i32 %0, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !42
  %2 = load i64*, i64** %data, align 8, !dbg !43
  %3 = bitcast i64* %2 to i8*, !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !43
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !43
  %5 = load i64*, i64** %data, align 8, !dbg !43
  %6 = bitcast i64* %5 to i8*, !dbg !43
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !43
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #5, !dbg !43
  %8 = load i64*, i64** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !44
  %9 = load i64, i64* %arrayidx, align 8, !dbg !44
  call void @printLongLongLine(i64 noundef %9), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !79
  %cmp = icmp ne i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i64* %arraydecay, i64** %data, align 8, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !91
  %2 = load i64*, i64** %data, align 8, !dbg !92
  %3 = bitcast i64* %2 to i8*, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !92
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !92
  %5 = load i64*, i64** %data, align 8, !dbg !92
  %6 = bitcast i64* %5 to i8*, !dbg !92
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !92
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #5, !dbg !92
  %8 = load i64*, i64** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !93
  %9 = load i64, i64* %arrayidx, align 8, !dbg !93
  call void @printLongLongLine(i64 noundef %9), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !103
  %cmp = icmp eq i32 %0, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i64* %arraydecay, i64** %data, align 8, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !113
  %2 = load i64*, i64** %data, align 8, !dbg !114
  %3 = bitcast i64* %2 to i8*, !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !114
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !114
  %5 = load i64*, i64** %data, align 8, !dbg !114
  %6 = bitcast i64* %5 to i8*, !dbg !114
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !114
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #5, !dbg !114
  %8 = load i64*, i64** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !115
  %9 = load i64, i64* %arrayidx, align 8, !dbg !115
  call void @printLongLongLine(i64 noundef %9), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 23, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 24, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 13, scope: !11)
!32 = !DILocation(line: 26, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!34 = !DILocation(line: 26, column: 25, scope: !33)
!35 = !DILocation(line: 26, column: 8, scope: !11)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 33, type: !28)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!42 = !DILocation(line: 33, column: 17, scope: !41)
!43 = !DILocation(line: 35, column: 9, scope: !41)
!44 = !DILocation(line: 36, column: 27, scope: !41)
!45 = !DILocation(line: 36, column: 9, scope: !41)
!46 = !DILocation(line: 38, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_13_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 89, column: 5, scope: !47)
!49 = !DILocation(line: 90, column: 5, scope: !47)
!50 = !DILocation(line: 91, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !52, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 103, type: !54)
!59 = !DILocation(line: 103, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 103, type: !55)
!61 = !DILocation(line: 103, column: 27, scope: !51)
!62 = !DILocation(line: 106, column: 22, scope: !51)
!63 = !DILocation(line: 106, column: 12, scope: !51)
!64 = !DILocation(line: 106, column: 5, scope: !51)
!65 = !DILocation(line: 108, column: 5, scope: !51)
!66 = !DILocation(line: 109, column: 5, scope: !51)
!67 = !DILocation(line: 110, column: 5, scope: !51)
!68 = !DILocation(line: 113, column: 5, scope: !51)
!69 = !DILocation(line: 114, column: 5, scope: !51)
!70 = !DILocation(line: 115, column: 5, scope: !51)
!71 = !DILocation(line: 117, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 47, type: !17)
!74 = !DILocation(line: 47, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !12, line: 48, type: !23)
!76 = !DILocation(line: 48, column: 13, scope: !72)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !12, line: 49, type: !28)
!78 = !DILocation(line: 49, column: 13, scope: !72)
!79 = !DILocation(line: 50, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !12, line: 50, column: 8)
!81 = !DILocation(line: 50, column: 25, scope: !80)
!82 = !DILocation(line: 50, column: 8, scope: !72)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 51, column: 5)
!85 = !DILocation(line: 54, column: 5, scope: !84)
!86 = !DILocation(line: 58, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !12, line: 56, column: 5)
!88 = !DILocation(line: 58, column: 14, scope: !87)
!89 = !DILocalVariable(name: "source", scope: !90, file: !12, line: 61, type: !28)
!90 = distinct !DILexicalBlock(scope: !72, file: !12, line: 60, column: 5)
!91 = !DILocation(line: 61, column: 17, scope: !90)
!92 = !DILocation(line: 63, column: 9, scope: !90)
!93 = !DILocation(line: 64, column: 27, scope: !90)
!94 = !DILocation(line: 64, column: 9, scope: !90)
!95 = !DILocation(line: 66, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 71, type: !17)
!98 = !DILocation(line: 71, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 72, type: !23)
!100 = !DILocation(line: 72, column: 13, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 73, type: !28)
!102 = !DILocation(line: 73, column: 13, scope: !96)
!103 = !DILocation(line: 74, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !12, line: 74, column: 8)
!105 = !DILocation(line: 74, column: 25, scope: !104)
!106 = !DILocation(line: 74, column: 8, scope: !96)
!107 = !DILocation(line: 77, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 75, column: 5)
!109 = !DILocation(line: 77, column: 14, scope: !108)
!110 = !DILocation(line: 78, column: 5, scope: !108)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 80, type: !28)
!112 = distinct !DILexicalBlock(scope: !96, file: !12, line: 79, column: 5)
!113 = !DILocation(line: 80, column: 17, scope: !112)
!114 = !DILocation(line: 82, column: 9, scope: !112)
!115 = !DILocation(line: 83, column: 27, scope: !112)
!116 = !DILocation(line: 83, column: 9, scope: !112)
!117 = !DILocation(line: 85, column: 1, scope: !96)
