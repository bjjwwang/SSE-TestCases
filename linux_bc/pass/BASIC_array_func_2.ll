; ModuleID = 'linux_bc/pass/BASIC_array_func_2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @getValue(%struct.A* %arr, i32 %x) #0 !dbg !9 {
entry:
  %retval = alloca %struct.A, align 4
  %arr.addr = alloca %struct.A*, align 8
  %x.addr = alloca i32, align 4
  store %struct.A* %arr, %struct.A** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.A** %arr.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load %struct.A*, %struct.A** %arr.addr, align 8, !dbg !24
  %1 = load i32, i32* %x.addr, align 4, !dbg !25
  %idxprom = sext i32 %1 to i64, !dbg !24
  %arrayidx = getelementptr inbounds %struct.A, %struct.A* %0, i64 %idxprom, !dbg !24
  %2 = bitcast %struct.A* %retval to i8*, !dbg !24
  %3 = bitcast %struct.A* %arrayidx to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 4 %3, i64 8, i1 false), !dbg !24
  %4 = bitcast %struct.A* %retval to i64*, !dbg !26
  %5 = load i64, i64* %4, align 4, !dbg !26
  ret i64 %5, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x %struct.A], align 16
  %res = alloca %struct.A, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x %struct.A]* %a, metadata !30, metadata !DIExpression()), !dbg !34
  %arrayidx = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !35
  %a1 = getelementptr inbounds %struct.A, %struct.A* %arrayidx, i32 0, i32 0, !dbg !36
  store i32 10, i32* %a1, align 16, !dbg !37
  %arrayidx2 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !38
  %b = getelementptr inbounds %struct.A, %struct.A* %arrayidx2, i32 0, i32 1, !dbg !39
  store i32 11, i32* %b, align 4, !dbg !40
  %arrayidx3 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !41
  %a4 = getelementptr inbounds %struct.A, %struct.A* %arrayidx3, i32 0, i32 0, !dbg !42
  store i32 20, i32* %a4, align 8, !dbg !43
  %arrayidx5 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !44
  %b6 = getelementptr inbounds %struct.A, %struct.A* %arrayidx5, i32 0, i32 1, !dbg !45
  store i32 21, i32* %b6, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata %struct.A* %res, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !49
  %call = call i64 @getValue(%struct.A* %arraydecay, i32 1), !dbg !50
  %0 = bitcast %struct.A* %res to i64*, !dbg !50
  store i64 %call, i64* %0, align 4, !dbg !50
  %b7 = getelementptr inbounds %struct.A, %struct.A* %res, i32 0, i32 1, !dbg !51
  %1 = load i32, i32* %b7, align 4, !dbg !51
  %cmp = icmp eq i32 %1, 21, !dbg !52
  call void @svf_assert(i1 zeroext %cmp), !dbg !53
  ret i32 0, !dbg !54
}

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !19, !17}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 11, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 8, size: 64, elements: !15)
!15 = !{!16, !18}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !14, file: !10, line: 9, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !14, file: !10, line: 10, baseType: !17, size: 32, offset: 32)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!20 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 13, type: !19)
!21 = !DILocation(line: 13, column: 15, scope: !9)
!22 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 13, type: !17)
!23 = !DILocation(line: 13, column: 24, scope: !9)
!24 = !DILocation(line: 14, column: 12, scope: !9)
!25 = !DILocation(line: 14, column: 16, scope: !9)
!26 = !DILocation(line: 14, column: 5, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !28, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!17}
!30 = !DILocalVariable(name: "a", scope: !27, file: !10, line: 18, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 2)
!34 = !DILocation(line: 18, column: 7, scope: !27)
!35 = !DILocation(line: 19, column: 5, scope: !27)
!36 = !DILocation(line: 19, column: 10, scope: !27)
!37 = !DILocation(line: 19, column: 12, scope: !27)
!38 = !DILocation(line: 20, column: 5, scope: !27)
!39 = !DILocation(line: 20, column: 10, scope: !27)
!40 = !DILocation(line: 20, column: 12, scope: !27)
!41 = !DILocation(line: 21, column: 5, scope: !27)
!42 = !DILocation(line: 21, column: 10, scope: !27)
!43 = !DILocation(line: 21, column: 12, scope: !27)
!44 = !DILocation(line: 22, column: 5, scope: !27)
!45 = !DILocation(line: 22, column: 10, scope: !27)
!46 = !DILocation(line: 22, column: 12, scope: !27)
!47 = !DILocalVariable(name: "res", scope: !27, file: !10, line: 23, type: !13)
!48 = !DILocation(line: 23, column: 7, scope: !27)
!49 = !DILocation(line: 23, column: 22, scope: !27)
!50 = !DILocation(line: 23, column: 13, scope: !27)
!51 = !DILocation(line: 24, column: 20, scope: !27)
!52 = !DILocation(line: 24, column: 22, scope: !27)
!53 = !DILocation(line: 24, column: 5, scope: !27)
!54 = !DILocation(line: 25, column: 5, scope: !27)
