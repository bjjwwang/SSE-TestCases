; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 800, align 16, !dbg !28
  %3 = bitcast i8* %2 to i64*, !dbg !29
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !27
  %call = call i32 @staticReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !33
  store i64* %4, i64** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !42
  %6 = load i64*, i64** %data, align 8, !dbg !43
  %7 = bitcast i64* %6 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !43
  %8 = bitcast i64* %arraydecay to i8*, !dbg !43
  %9 = load i64*, i64** %data, align 8, !dbg !43
  %10 = bitcast i64* %9 to i8*, !dbg !43
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !43
  %call1 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !43
  %12 = load i64*, i64** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !44
  %13 = load i64, i64* %arrayidx, align 8, !dbg !44
  call void @printLongLongLine(i64 noundef %13), !dbg !45
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08_good() #0 !dbg !47 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i64*, !dbg !82
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = alloca i8, i64 800, align 16, !dbg !85
  %3 = bitcast i8* %2 to i64*, !dbg !86
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !93
  store i64* %4, i64** %data, align 8, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !98
  %6 = load i64*, i64** %data, align 8, !dbg !99
  %7 = bitcast i64* %6 to i8*, !dbg !99
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !99
  %8 = bitcast i64* %arraydecay to i8*, !dbg !99
  %9 = load i64*, i64** %data, align 8, !dbg !99
  %10 = bitcast i64* %9 to i8*, !dbg !99
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !99
  %call1 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !99
  %12 = load i64*, i64** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !100
  %13 = load i64, i64* %arrayidx, align 8, !dbg !100
  call void @printLongLongLine(i64 noundef %13), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !103 {
entry:
  ret i32 0, !dbg !104
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 400, align 16, !dbg !110
  %1 = bitcast i8* %0 to i64*, !dbg !111
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 800, align 16, !dbg !114
  %3 = bitcast i8* %2 to i64*, !dbg !115
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !113
  %call = call i32 @staticReturnsTrue(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !119
  store i64* %4, i64** %data, align 8, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !125
  %6 = load i64*, i64** %data, align 8, !dbg !126
  %7 = bitcast i64* %6 to i8*, !dbg !126
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !126
  %8 = bitcast i64* %arraydecay to i8*, !dbg !126
  %9 = load i64*, i64** %data, align 8, !dbg !126
  %10 = bitcast i64* %9 to i8*, !dbg !126
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !126
  %call1 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !126
  %12 = load i64*, i64** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !127
  %13 = load i64, i64* %arrayidx, align 8, !dbg !127
  call void @printLongLongLine(i64 noundef %13), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08_bad", scope: !16, file: !16, line: 35, type: !17, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 37, type: !3)
!21 = !DILocation(line: 37, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 38, type: !3)
!23 = !DILocation(line: 38, column: 15, scope: !15)
!24 = !DILocation(line: 38, column: 42, scope: !15)
!25 = !DILocation(line: 38, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 39, type: !3)
!27 = !DILocation(line: 39, column: 15, scope: !15)
!28 = !DILocation(line: 39, column: 43, scope: !15)
!29 = !DILocation(line: 39, column: 32, scope: !15)
!30 = !DILocation(line: 40, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 8)
!32 = !DILocation(line: 40, column: 8, scope: !15)
!33 = !DILocation(line: 44, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !16, line: 41, column: 5)
!35 = !DILocation(line: 44, column: 14, scope: !34)
!36 = !DILocation(line: 45, column: 5, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 47, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 47, column: 17, scope: !38)
!43 = !DILocation(line: 49, column: 9, scope: !38)
!44 = !DILocation(line: 50, column: 27, scope: !38)
!45 = !DILocation(line: 50, column: 9, scope: !38)
!46 = !DILocation(line: 52, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_08_good", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!48 = !DILocation(line: 103, column: 5, scope: !47)
!49 = !DILocation(line: 104, column: 5, scope: !47)
!50 = !DILocation(line: 105, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 117, type: !52, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 117, type: !54)
!59 = !DILocation(line: 117, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 117, type: !55)
!61 = !DILocation(line: 117, column: 27, scope: !51)
!62 = !DILocation(line: 120, column: 22, scope: !51)
!63 = !DILocation(line: 120, column: 12, scope: !51)
!64 = !DILocation(line: 120, column: 5, scope: !51)
!65 = !DILocation(line: 122, column: 5, scope: !51)
!66 = !DILocation(line: 123, column: 5, scope: !51)
!67 = !DILocation(line: 124, column: 5, scope: !51)
!68 = !DILocation(line: 127, column: 5, scope: !51)
!69 = !DILocation(line: 128, column: 5, scope: !51)
!70 = !DILocation(line: 129, column: 5, scope: !51)
!71 = !DILocation(line: 131, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 23, type: !73, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!73 = !DISubroutineType(types: !74)
!74 = !{!54}
!75 = !DILocation(line: 25, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!77 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 61, type: !3)
!78 = !DILocation(line: 61, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !16, line: 62, type: !3)
!80 = !DILocation(line: 62, column: 15, scope: !76)
!81 = !DILocation(line: 62, column: 42, scope: !76)
!82 = !DILocation(line: 62, column: 31, scope: !76)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !16, line: 63, type: !3)
!84 = !DILocation(line: 63, column: 15, scope: !76)
!85 = !DILocation(line: 63, column: 43, scope: !76)
!86 = !DILocation(line: 63, column: 32, scope: !76)
!87 = !DILocation(line: 64, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !76, file: !16, line: 64, column: 8)
!89 = !DILocation(line: 64, column: 8, scope: !76)
!90 = !DILocation(line: 67, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !16, line: 65, column: 5)
!92 = !DILocation(line: 68, column: 5, scope: !91)
!93 = !DILocation(line: 72, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !16, line: 70, column: 5)
!95 = !DILocation(line: 72, column: 14, scope: !94)
!96 = !DILocalVariable(name: "source", scope: !97, file: !16, line: 75, type: !39)
!97 = distinct !DILexicalBlock(scope: !76, file: !16, line: 74, column: 5)
!98 = !DILocation(line: 75, column: 17, scope: !97)
!99 = !DILocation(line: 77, column: 9, scope: !97)
!100 = !DILocation(line: 78, column: 27, scope: !97)
!101 = !DILocation(line: 78, column: 9, scope: !97)
!102 = !DILocation(line: 80, column: 1, scope: !76)
!103 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 28, type: !73, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!104 = !DILocation(line: 30, column: 5, scope: !103)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 85, type: !3)
!107 = !DILocation(line: 85, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !16, line: 86, type: !3)
!109 = !DILocation(line: 86, column: 15, scope: !105)
!110 = !DILocation(line: 86, column: 42, scope: !105)
!111 = !DILocation(line: 86, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !16, line: 87, type: !3)
!113 = !DILocation(line: 87, column: 15, scope: !105)
!114 = !DILocation(line: 87, column: 43, scope: !105)
!115 = !DILocation(line: 87, column: 32, scope: !105)
!116 = !DILocation(line: 88, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !16, line: 88, column: 8)
!118 = !DILocation(line: 88, column: 8, scope: !105)
!119 = !DILocation(line: 91, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 89, column: 5)
!121 = !DILocation(line: 91, column: 14, scope: !120)
!122 = !DILocation(line: 92, column: 5, scope: !120)
!123 = !DILocalVariable(name: "source", scope: !124, file: !16, line: 94, type: !39)
!124 = distinct !DILexicalBlock(scope: !105, file: !16, line: 93, column: 5)
!125 = !DILocation(line: 94, column: 17, scope: !124)
!126 = !DILocation(line: 96, column: 9, scope: !124)
!127 = !DILocation(line: 97, column: 27, scope: !124)
!128 = !DILocation(line: 97, column: 9, scope: !124)
!129 = !DILocation(line: 99, column: 1, scope: !105)
