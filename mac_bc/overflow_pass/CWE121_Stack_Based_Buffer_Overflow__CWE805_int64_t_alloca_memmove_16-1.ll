; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16_bad() #0 !dbg !15 {
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
  br label %while.body, !dbg !30

while.body:                                       ; preds = %entry
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !31
  store i64* %4, i64** %data, align 8, !dbg !33
  br label %while.end, !dbg !34

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !40
  %6 = load i64*, i64** %data, align 8, !dbg !41
  %7 = bitcast i64* %6 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !41
  %8 = bitcast i64* %arraydecay to i8*, !dbg !41
  %9 = load i64*, i64** %data, align 8, !dbg !41
  %10 = bitcast i64* %9 to i8*, !dbg !41
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !41
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !41
  %12 = load i64*, i64** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !42
  %13 = load i64, i64* %arrayidx, align 8, !dbg !42
  call void @printLongLongLine(i64 noundef %13), !dbg !43
  ret void, !dbg !44
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 400, align 16, !dbg !74
  %1 = bitcast i8* %0 to i64*, !dbg !75
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = alloca i8, i64 800, align 16, !dbg !78
  %3 = bitcast i8* %2 to i64*, !dbg !79
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !77
  br label %while.body, !dbg !80

while.body:                                       ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !81
  store i64* %4, i64** %data, align 8, !dbg !83
  br label %while.end, !dbg !84

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !87
  %6 = load i64*, i64** %data, align 8, !dbg !88
  %7 = bitcast i64* %6 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !88
  %8 = bitcast i64* %arraydecay to i8*, !dbg !88
  %9 = load i64*, i64** %data, align 8, !dbg !88
  %10 = bitcast i64* %9 to i8*, !dbg !88
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !88
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !88
  %12 = load i64*, i64** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !89
  %13 = load i64, i64* %arrayidx, align 8, !dbg !89
  call void @printLongLongLine(i64 noundef %13), !dbg !90
  ret void, !dbg !91
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 24, type: !3)
!23 = !DILocation(line: 24, column: 15, scope: !15)
!24 = !DILocation(line: 24, column: 42, scope: !15)
!25 = !DILocation(line: 24, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 25, type: !3)
!27 = !DILocation(line: 25, column: 15, scope: !15)
!28 = !DILocation(line: 25, column: 43, scope: !15)
!29 = !DILocation(line: 25, column: 32, scope: !15)
!30 = !DILocation(line: 26, column: 5, scope: !15)
!31 = !DILocation(line: 30, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 27, column: 5)
!33 = !DILocation(line: 30, column: 14, scope: !32)
!34 = !DILocation(line: 31, column: 9, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 34, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 34, column: 17, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 27, scope: !36)
!43 = !DILocation(line: 37, column: 9, scope: !36)
!44 = !DILocation(line: 39, column: 1, scope: !15)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_16_good", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocation(line: 67, column: 5, scope: !45)
!47 = !DILocation(line: 68, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 80, type: !49, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !16, line: 80, type: !51)
!56 = !DILocation(line: 80, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !16, line: 80, type: !52)
!58 = !DILocation(line: 80, column: 27, scope: !48)
!59 = !DILocation(line: 83, column: 22, scope: !48)
!60 = !DILocation(line: 83, column: 12, scope: !48)
!61 = !DILocation(line: 83, column: 5, scope: !48)
!62 = !DILocation(line: 85, column: 5, scope: !48)
!63 = !DILocation(line: 86, column: 5, scope: !48)
!64 = !DILocation(line: 87, column: 5, scope: !48)
!65 = !DILocation(line: 90, column: 5, scope: !48)
!66 = !DILocation(line: 91, column: 5, scope: !48)
!67 = !DILocation(line: 92, column: 5, scope: !48)
!68 = !DILocation(line: 94, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 46, type: !17, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!70 = !DILocalVariable(name: "data", scope: !69, file: !16, line: 48, type: !3)
!71 = !DILocation(line: 48, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !16, line: 49, type: !3)
!73 = !DILocation(line: 49, column: 15, scope: !69)
!74 = !DILocation(line: 49, column: 42, scope: !69)
!75 = !DILocation(line: 49, column: 31, scope: !69)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !16, line: 50, type: !3)
!77 = !DILocation(line: 50, column: 15, scope: !69)
!78 = !DILocation(line: 50, column: 43, scope: !69)
!79 = !DILocation(line: 50, column: 32, scope: !69)
!80 = !DILocation(line: 51, column: 5, scope: !69)
!81 = !DILocation(line: 54, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !69, file: !16, line: 52, column: 5)
!83 = !DILocation(line: 54, column: 14, scope: !82)
!84 = !DILocation(line: 55, column: 9, scope: !82)
!85 = !DILocalVariable(name: "source", scope: !86, file: !16, line: 58, type: !37)
!86 = distinct !DILexicalBlock(scope: !69, file: !16, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 17, scope: !86)
!88 = !DILocation(line: 60, column: 9, scope: !86)
!89 = !DILocation(line: 61, column: 27, scope: !86)
!90 = !DILocation(line: 61, column: 9, scope: !86)
!91 = !DILocation(line: 63, column: 1, scope: !69)
