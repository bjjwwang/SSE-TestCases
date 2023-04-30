; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Memset_CountOverflow_BadCase02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Memset_CountOverflow_BadCase02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.DEST = type { i32, [128 x i8] }

@dest = global [128 x i8] zeroinitializer, align 16, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @cwe120_c_50() #0 !dbg !17 {
entry:
  %temp = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata [10 x i8]* %temp, metadata !22, metadata !DIExpression()), !dbg !26
  %0 = bitcast [10 x i8]* %temp to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %temp, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay, i8 0, i64 10, i1 false), !dbg !27
  ret i32 0, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_49() #0 !dbg !29 {
entry:
  %dest = alloca %struct.DEST*, align 8
  call void @llvm.dbg.declare(metadata %struct.DEST** %dest, metadata !32, metadata !DIExpression()), !dbg !39
  %0 = load %struct.DEST*, %struct.DEST** %dest, align 8, !dbg !40
  %1 = bitcast %struct.DEST* %0 to i8*, !dbg !40
  %2 = load %struct.DEST*, %struct.DEST** %dest, align 8, !dbg !40
  %3 = bitcast %struct.DEST* %2 to i8*, !dbg !40
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !40
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 0, i64 noundef 8, i64 noundef %4) #4, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @cwe120_c_49(), !dbg !43
  %call = call i32 @cwe120_c_50(), !dbg !44
  ret i32 0, !dbg !45
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dest", scope: !2, file: !5, line: 32, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Memset_CountOverflow_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!4 = !{!0}
!5 = !DIFile(filename: "function/Memset_CountOverflow_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !8)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!9}
!9 = !DISubrange(count: 128)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "cwe120_c_50", scope: !5, file: !5, line: 19, type: !18, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "temp", scope: !17, file: !5, line: 21, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 80, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 21, column: 10, scope: !17)
!27 = !DILocation(line: 23, column: 5, scope: !17)
!28 = !DILocation(line: 25, column: 5, scope: !17)
!29 = distinct !DISubprogram(name: "cwe120_c_49", scope: !5, file: !5, line: 37, type: !30, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocalVariable(name: "dest", scope: !29, file: !5, line: 39, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "PDEST", file: !5, line: 31, baseType: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !5, line: 28, size: 1056, elements: !36)
!36 = !{!37, !38}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !35, file: !5, line: 29, baseType: !20, size: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !35, file: !5, line: 30, baseType: !6, size: 1024, offset: 32)
!39 = !DILocation(line: 39, column: 11, scope: !29)
!40 = !DILocation(line: 41, column: 5, scope: !29)
!41 = !DILocation(line: 42, column: 1, scope: !29)
!42 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 44, type: !18, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!43 = !DILocation(line: 46, column: 5, scope: !42)
!44 = !DILocation(line: 47, column: 5, scope: !42)
!45 = !DILocation(line: 48, column: 5, scope: !42)
