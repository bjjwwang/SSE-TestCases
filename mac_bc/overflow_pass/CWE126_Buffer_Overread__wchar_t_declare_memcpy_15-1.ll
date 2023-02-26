; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !48
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx7, align 4, !dbg !50
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !51
  %1 = load i32*, i32** %data, align 8, !dbg !51
  %2 = bitcast i32* %1 to i8*, !dbg !51
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !51
  %mul = mul i64 %call10, 4, !dbg !51
  %call11 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !51
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx12, align 4, !dbg !53
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  call void @printWLine(i32* noundef %arraydecay13), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_good() #0 !dbg !57 {
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
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_bad(), !dbg !78
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
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !89
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !93
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx3, align 4, !dbg !95
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay4, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !102
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx7, align 4, !dbg !104
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %2 = bitcast i32* %1 to i8*, !dbg !105
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !105
  %mul = mul i64 %call10, 4, !dbg !105
  %call11 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !105
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx12, align 4, !dbg !107
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  call void @printWLine(i32* noundef %arraydecay13), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !118
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !119
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !123
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx3, align 4, !dbg !125
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay4, i32** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !132
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx7, align 4, !dbg !134
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !135
  %1 = load i32*, i32** %data, align 8, !dbg !135
  %2 = bitcast i32* %1 to i8*, !dbg !135
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !135
  %mul = mul i64 %call10, 4, !dbg !135
  %call11 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !135
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx12, align 4, !dbg !137
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  call void @printWLine(i32* noundef %arraydecay13), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 28, column: 13, scope: !11)
!35 = !DILocation(line: 28, column: 5, scope: !11)
!36 = !DILocation(line: 29, column: 5, scope: !11)
!37 = !DILocation(line: 29, column: 25, scope: !11)
!38 = !DILocation(line: 30, column: 13, scope: !11)
!39 = !DILocation(line: 30, column: 5, scope: !11)
!40 = !DILocation(line: 31, column: 5, scope: !11)
!41 = !DILocation(line: 31, column: 27, scope: !11)
!42 = !DILocation(line: 36, column: 16, scope: !11)
!43 = !DILocation(line: 36, column: 14, scope: !11)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 44, type: !30)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!46 = !DILocation(line: 44, column: 17, scope: !45)
!47 = !DILocation(line: 45, column: 17, scope: !45)
!48 = !DILocation(line: 45, column: 9, scope: !45)
!49 = !DILocation(line: 46, column: 9, scope: !45)
!50 = !DILocation(line: 46, column: 21, scope: !45)
!51 = !DILocation(line: 49, column: 9, scope: !45)
!52 = !DILocation(line: 50, column: 9, scope: !45)
!53 = !DILocation(line: 50, column: 21, scope: !45)
!54 = !DILocation(line: 51, column: 20, scope: !45)
!55 = !DILocation(line: 51, column: 9, scope: !45)
!56 = !DILocation(line: 53, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_good", scope: !12, file: !12, line: 125, type: !13, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!58 = !DILocation(line: 127, column: 5, scope: !57)
!59 = !DILocation(line: 128, column: 5, scope: !57)
!60 = !DILocation(line: 129, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 141, type: !62, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!62 = !DISubroutineType(types: !63)
!63 = !{!22, !22, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 141, type: !22)
!68 = !DILocation(line: 141, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 141, type: !64)
!70 = !DILocation(line: 141, column: 27, scope: !61)
!71 = !DILocation(line: 144, column: 22, scope: !61)
!72 = !DILocation(line: 144, column: 12, scope: !61)
!73 = !DILocation(line: 144, column: 5, scope: !61)
!74 = !DILocation(line: 146, column: 5, scope: !61)
!75 = !DILocation(line: 147, column: 5, scope: !61)
!76 = !DILocation(line: 148, column: 5, scope: !61)
!77 = !DILocation(line: 151, column: 5, scope: !61)
!78 = !DILocation(line: 152, column: 5, scope: !61)
!79 = !DILocation(line: 153, column: 5, scope: !61)
!80 = !DILocation(line: 155, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 62, type: !17)
!83 = !DILocation(line: 62, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 63, type: !25)
!85 = !DILocation(line: 63, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 64, type: !30)
!87 = !DILocation(line: 64, column: 13, scope: !81)
!88 = !DILocation(line: 65, column: 13, scope: !81)
!89 = !DILocation(line: 65, column: 5, scope: !81)
!90 = !DILocation(line: 66, column: 5, scope: !81)
!91 = !DILocation(line: 66, column: 25, scope: !81)
!92 = !DILocation(line: 67, column: 13, scope: !81)
!93 = !DILocation(line: 67, column: 5, scope: !81)
!94 = !DILocation(line: 68, column: 5, scope: !81)
!95 = !DILocation(line: 68, column: 27, scope: !81)
!96 = !DILocation(line: 77, column: 16, scope: !81)
!97 = !DILocation(line: 77, column: 14, scope: !81)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 81, type: !30)
!99 = distinct !DILexicalBlock(scope: !81, file: !12, line: 80, column: 5)
!100 = !DILocation(line: 81, column: 17, scope: !99)
!101 = !DILocation(line: 82, column: 17, scope: !99)
!102 = !DILocation(line: 82, column: 9, scope: !99)
!103 = !DILocation(line: 83, column: 9, scope: !99)
!104 = !DILocation(line: 83, column: 21, scope: !99)
!105 = !DILocation(line: 86, column: 9, scope: !99)
!106 = !DILocation(line: 87, column: 9, scope: !99)
!107 = !DILocation(line: 87, column: 21, scope: !99)
!108 = !DILocation(line: 88, column: 20, scope: !99)
!109 = !DILocation(line: 88, column: 9, scope: !99)
!110 = !DILocation(line: 90, column: 1, scope: !81)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 95, type: !17)
!113 = !DILocation(line: 95, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 96, type: !25)
!115 = !DILocation(line: 96, column: 13, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 97, type: !30)
!117 = !DILocation(line: 97, column: 13, scope: !111)
!118 = !DILocation(line: 98, column: 13, scope: !111)
!119 = !DILocation(line: 98, column: 5, scope: !111)
!120 = !DILocation(line: 99, column: 5, scope: !111)
!121 = !DILocation(line: 99, column: 25, scope: !111)
!122 = !DILocation(line: 100, column: 13, scope: !111)
!123 = !DILocation(line: 100, column: 5, scope: !111)
!124 = !DILocation(line: 101, column: 5, scope: !111)
!125 = !DILocation(line: 101, column: 27, scope: !111)
!126 = !DILocation(line: 106, column: 16, scope: !111)
!127 = !DILocation(line: 106, column: 14, scope: !111)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 114, type: !30)
!129 = distinct !DILexicalBlock(scope: !111, file: !12, line: 113, column: 5)
!130 = !DILocation(line: 114, column: 17, scope: !129)
!131 = !DILocation(line: 115, column: 17, scope: !129)
!132 = !DILocation(line: 115, column: 9, scope: !129)
!133 = !DILocation(line: 116, column: 9, scope: !129)
!134 = !DILocation(line: 116, column: 21, scope: !129)
!135 = !DILocation(line: 119, column: 9, scope: !129)
!136 = !DILocation(line: 120, column: 9, scope: !129)
!137 = !DILocation(line: 120, column: 21, scope: !129)
!138 = !DILocation(line: 121, column: 20, scope: !129)
!139 = !DILocation(line: 121, column: 9, scope: !129)
!140 = !DILocation(line: 123, column: 1, scope: !111)
